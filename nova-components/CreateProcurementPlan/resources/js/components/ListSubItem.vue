<template>
    <li class="list-sub-item flex flex-row justify-between items-center px-4 pr-2 pl-0 ml-8">
        <div class="list-sub-item-title">
            <p class="attr">sttrs: 111</p>
            <p class="sku-title">sku: 111</p>
        </div>
        <div class="list-sub-item-sku">
            <p class="pro-price">price: 111</p>
            <p class="provider">
                <span>a</span>
                <span>a</span>
                <span>a</span>
            </p>
        </div>
    </li>
</template>

<script>
  export default {
    name: 'ListSubItem'
  }
</script>

<style  scoped>
    .list-sub-item {
        border-bottom: 1px solid #e9e9e9;
    }
    .list-sub-item:nth-last-child {
        border-bottom: none;
    }
</style>