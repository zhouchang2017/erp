<template>
    <div class="list-item flex">
        <div class="flex flex-row px-6 py-4 w-full items-center">
            <img class="block h-16 rounded-full"
                 src="https://img.alicdn.com/imgextra/i4/2616970884/TB2gWr5XWmgSKJjSspiXXXyJFXa_!!2616970884.jpg"
                 alt="">
            <div class="text-left pl-4 flex flex-col justify-center flex-1">
                <p class="text-xl leading-tight">Apple/苹果iPhone 8 Plus 64G 智能手机 苹果8p iPhone8p</p>
                <p class="text-sm leading-tight">
                    <span class="pro-name">apple iphone 8 plus 64g</span>
                </p>
                <div class="text-xs font-semibold leading-normal pt-1">
                    <span class="border border-purple text-purple rounded-full px-2">type</span>
                    <span class="border border-purple text-purple rounded-full px-2">brand</span>
                </div>
            </div>
            <div class="flex items-center justify-center"><span class="allow">▽</span></div>
        </div>
        <!--<ul class="list-sub-items">-->
            <!--<v-list-sub-item/>-->
        <!--</ul>-->
    </div>
</template>

<script>
  export default {
    name: 'ListItem',
    components: {
      'v-list-sub-item': require('./ListSubItem')
    }
  }
</script>

<style scoped>
.list-item{
    border-bottom: 1px solid #e9e9e9;
    padding-top: 20px;
}
</style>