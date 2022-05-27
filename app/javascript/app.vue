<template>
  <ul>
    <li v-for="(message, index) in messages" :key="index">
      {{ message }}
    </li>
  </ul>
</template>

<script>
export default {
  data: function () {
    return {
      messages: []
    }
  },
  created() {
    console.log('WebSocket is connected.');

    const socket = new WebSocket('ws://localhost:3000/cable');

    socket.onopen = () => {
      const subscribeMsg = {
        command: 'subscribe',
        identifier: JSON.stringify({
          channel: 'MainChannel',
        }),
      };

      socket.send(JSON.stringify(subscribeMsg));
    };

    socket.onmessage = (event) => {
      const response = event.data;
      const data = JSON.parse(response);

      if (data.type === 'ping')                 { return; }
      if (data.type === 'welcome')              { return; }
      if (data.type === 'confirm_subscription') { return; }

      // console.log('FROM RAILS: ', data);
      this.messages.push(data.message);
    };
  },
}
</script>

<style scoped>

</style>
