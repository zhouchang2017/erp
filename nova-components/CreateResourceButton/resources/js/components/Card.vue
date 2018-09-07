<template>
    <div>
        <span v-if="shouldShowButtons" class="ml-auto">
        <!-- Attach Related Models -->
        <router-link
                v-if="shouldShowAttachButton"
                dusk="attach-button"
                :class="classes"
                tag="button"
                :to="{
                name: 'attach',
                params: {
                    resourceName: viaResource,
                    resourceId: viaResourceId,
                    relatedResourceName: resourceName
                },
                query: {
                    viaRelationship: viaRelationship,
                    polymorphic: relationshipType == 'morphToMany' ? '1' : '0'
                }
            }"
        >
            <slot>
                {{__('Attach')}} {{singularName}}
            </slot>
        </router-link>

            <!-- Create Related Models -->
        <router-link
                v-else-if="shouldShowCreateButton"
                tag="button"
                dusk="create-button"
                :class="classes"
                :to="{
                name: 'create',
                params: {
                    resourceName: resourceName
                },
                query: {
                    viaResource: viaResource,
                    viaResourceId: viaResourceId,
                    viaRelationship: viaRelationship
                }
            }"
        >
            {{__('Create')}} {{singularName}}
        </router-link>
    </span>
        <span v-if="shouldShowCustomCreateButton" class="ml-auto">
            <router-link
                    tag="button"
                    dusk="create-button"
                    :class="classes"
                    :to="customCreateButton.url"
            >
            {{__('Create')}} {{buttonName}}
        </router-link>
        </span>
    </div>

</template>

<script>
  import CreateResourceButton from '@/components/CreateResourceButton'

  export default {
    extends: CreateResourceButton,

    data () {
      return {
        customCreateButton: null
      }
    },

    computed: {
      shouldShowCustomCreateButton () {
        return !!this.customCreateButton
      },
      buttonName () {
        return _.get(this, 'customCreateButton.name', this.singularName)
      }
    },

    mounted () {
      this.customCreateButton = _.get(Nova, `config.customCreateResourceButtonConfig.${this.resourceName}`, null)
    },
  }
</script>
