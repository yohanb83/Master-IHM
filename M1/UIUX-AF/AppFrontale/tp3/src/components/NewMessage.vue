<template>
  <div>
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Nouveau message</h5>
        <div class="card-text">
          <input type="text" v-model="titre" class="form-control"/>
          <br/>
          <textarea v-model="texte" class="form-control"/>
          <br/>
          <button class="btn btn-primary" @click="submit">Soumettre</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "NewMessage",
  data: function () {
    return {
      titre: '',
      texte: ''
    }
  },
  methods: {
    submit: function () {
      this.$emit('newMessage', {titre: this.titre, texte: this.texte});
      this.titre = '';
      this.texte = '';
    }
  }
}
</script>

<style scoped>

</style>