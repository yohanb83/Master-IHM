<template>
  <div>
    <div class="col">
      <new-message @newMessage="onNewMessage"/>
    </div>
    <div class="col">
      <message-preview :msg="item" v-for="item in messages" :key="item.id" @selectMessage="onMessageSelected"/>
      Total : {{ count }}
    </div>
    <div class="col">
      <div v-if="selected">
        <message-detail :msg="selectedMessage"/>
      </div>
    </div>
  </div>
</template>

<script>
import NewMessage from "@/components/NewMessage";
import MessagePreview from "@/components/MessagePreview";
import MessageDetail from "@/components/MessageDetail";

export default {
  name: 'App',
  components: {
    MessageDetail,
    MessagePreview,
    NewMessage
  },
  data: function () {
    return {
      messages: [],
      selected: null
    }
  },
  methods: {
    onNewMessage: function (val) {
      this.messages.push({
        titre: val.titre,
        texte: val.texte,
        date: new Date(),
        id: this.messages.length,
        view: false
      });
    },
    onMessageSelected: function (val) {
      this.selected = val;
      this.selectedMessage.view = true;
    }
  },
  computed: {
    count: function () {
      return this.messages.length;
    },
    selectedMessage: function () {
      return this.messages.find(m => m.id === this.selected);
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

.col {
  width: 30%;
  display: inline-block;
  margin: 5px;
  vertical-align: top;
}
</style>
