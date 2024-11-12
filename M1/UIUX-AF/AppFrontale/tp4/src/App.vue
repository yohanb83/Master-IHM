<template>
  <div style="text-align: left">
    <inputs @newTodo="onNewTodo"/>
    <hr/>
    <div>
      <todo-item v-for="todo in todos" :key="todo.id" @deleteTodo="onDeleteTodo" :todo="todo"/>
    </div>
    <hr/>
    <p>On doit faire <span id="counter" :style="counterStyle">{{ count }}</span> tâches</p>
  </div>
</template>

<script>
import Inputs from "./components/Inputs";
import TodoItem from "./components/TodoItem";

export default {
  name: 'App',
  components: {
    Inputs,
    TodoItem
  },
  data: function () {
    return {
      todos: []
    }
  },
  methods: {
    onNewTodo: function (val) {
      this.todos.push({id: this.todos.length, text: val});
    },
    onDeleteTodo: function (val) {
      this.todos = this.todos.filter(t => t.id !== val.id)
    }
  },
  computed: {
    count: function () {
      return this.todos.length;
    },
    counterStyle: function () {
      return {color: this.todos.length < 5 ? 'black' : 'red'};
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

#counter {
  font-weight: bold;
}
</style>
