<template>
  <div class="row">
    <div class="col">
      <input type="text" id="new-todo-field" v-model="newTodo" class="form-control"/>
    </div>
    <div class="col" style="text-align: left">
      <button id="add-todo-btn" class="btn btn-primary" @click="submit">Ajouter</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "Inputs",
  data: function () {
    return {
      newTodo: null
    }
  },
  methods: {
    submit: function () {
      this.$emit('newTodo', this.newTodo);
      this.newTodo = null;
    }
  }
}
</script>

<style scoped>
.col {
  width: 30%;
  max-width: 30%;
}
</style>