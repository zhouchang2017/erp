export default {
  props: {
    field: {
      type: Object,
      required: true
    }
  },

  methods: {
    genId (item) {
      return item.group ? item.group.name + item.value : item.value
    }
  }
}