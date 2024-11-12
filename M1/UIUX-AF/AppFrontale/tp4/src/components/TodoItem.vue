<template>
  <div :id="'todo-' + todo.id">
    <button @click="deleteTodo" :id="'delete-' + todo.id" class="btn btn-link"><i class="fa fa-trash"></i></button>
    <span>{{ todo.text }}</span>
  </div>
</template>

<script>
export default {
  name: "TodoItem",
  props: {
    todo: {
      type: Object,
      required: true
    }
  },
  methods: {
    deleteTodo: function () {
      this.$emit('deleteTodo', this.todo);
    }
  }
}
</script>

<style scoped>

</style>