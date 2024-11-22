<template>
  <div :class="className">
    <table class="table">
      <tbody>
      <tr>
        <td>{{ msg.date.toLocaleDateString() }}</td>
        <td>{{ msg.titre }}</td>
        <td>
          <button class="btn btn-light" style="width: 5em" @click="view">Voir</button>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  name: "MessagePreview",
  props: {
    msg: {
      type: Object
    }
  },
  computed: {
    className: function () {
      return this.msg.view === false ? 'bold' : '';
    }
  },
  methods: {
    view: function () {
      this.$emit('selectMessage', this.msg.id);
    }
  }
}
</script>

<style scoped>
.bold {
  font-weight: bold;
}
</style>