<template>
  <div class="card" style="width: 18rem;">
    <div class="card-body">
      <h5 class="card-title">{{ msg.titre }}</h5>
      <p>{{ msg.date.toLocaleDateString() }}</p>
      <p class="card-text">
        {{ msg.texte }}
      </p>
    </div>
  </div>
</template>

<script>
export default {
  name: "MessageDetail",
  props: {
    msg: {
      type: Object
    }
  }
}
</script>

<style scoped>

</style>