<template>
  <div>
    <div class="col">
      <new-message @messageSubmit="messageSubmitHandler"/>
    </div>
    <div class="col">
      TODO ex 2
    </div>
    <div class="col">
      TODO ex 3
    </div>
  </div>
</template>

<script>
import NewMessage from "@/components/NewMessage";

export default {
  name: 'App',

  components: {
    NewMessage,
  },

  data: function () {
      return {
        messages: [],
        selected: null,
      };
    },

  methods: {
    messageSubmitHandler : function(content){
      console.log(content.titre + ": " + content.contenu)
    },
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

.col {
  width: 30%;
  display: inline-block;
  margin: 5px;
  vertical-align: top;
}
</style>
