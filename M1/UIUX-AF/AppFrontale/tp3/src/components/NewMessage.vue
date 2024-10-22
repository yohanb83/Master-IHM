<template>
  <div id="body">
    <h1>Nouveau message</h1>
    <input v-model="objet" placeholder="Objet">
    <textarea v-model="texte"></textarea>
    <button @click="messageSubmit">Soumettre</button>
  </div>
</template>

<script>
export default {
  name: "NewMessage",
  data: function () {
    return {
      objet: "",
      texte: "", 
    }
  },
  methods:{
    messageSubmit: function(event){
      this.$emit('messageSubmit', {titre: this.objet, contenu: this.texte})
      this.objet = ""
      this.texte = ""
    }
  }
}
</script>

<style scoped>

#body {
  display: flex;
  flex-direction: column;

  padding: 15px;

  border: 1px solid grey;
  border-radius: 5px 5px 5px 5px;
}

#body textarea{
  padding-top: 5px;
}

#body h1{
  font-size: larger;
}

#body button{
  background-color: blue;
  color: white;
  
}

#space{
  margin: 15px;
}

</style>