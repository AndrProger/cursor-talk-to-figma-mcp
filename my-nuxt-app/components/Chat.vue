<template>
  <div class="chat-widget" v-show="isOpen">
    <div class="chat-header">
      <h3 class="chat-title">Онлайн-консультант</h3>
    </div>
    
    <div class="messages-area" ref="messagesArea">
      <div v-for="(message, index) in messages" 
           :key="index" 
           :class="['message', message.type]">
        {{ message.text }}
      </div>
    </div>

    <div class="input-area">
      <input 
        type="text" 
        v-model="newMessage" 
        @keyup.enter="sendMessage"
        placeholder="Введите сообщение..."
        class="message-input"
      />
      <button @click="sendMessage" class="send-button">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <line x1="22" y1="2" x2="11" y2="13"></line>
          <polygon points="22 2 15 22 11 13 2 9 22 2"></polygon>
        </svg>
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, watch, nextTick } from 'vue'

const props = defineProps({
  isOpen: {
    type: Boolean,
    default: false
  }
})

const messages = ref([
  {
    type: 'bot',
    text: 'Здравствуйте! Я помогу вам подобрать идеальный автомобиль.'
  }
])

const newMessage = ref('')
const messagesArea = ref<HTMLDivElement | null>(null)

const sendMessage = () => {
  if (newMessage.value.trim()) {
    // Добавляем сообщение пользователя
    messages.value.push({
      type: 'user',
      text: newMessage.value.trim()
    })
    
    // Имитация ответа бота
    setTimeout(() => {
      messages.value.push({
        type: 'bot',
        text: 'Спасибо за ваше сообщение! Я обрабатываю ваш запрос.'
      })
    }, 1000)
    
    newMessage.value = ''
  }
}

// Автопрокрутка к последнему сообщению
watch(() => messages.value.length, () => {
  nextTick(() => {
    if (messagesArea.value) {
      messagesArea.value.scrollTop = messagesArea.value.scrollHeight
    }
  })
})
</script>

<style scoped>
.chat-widget {
  position: fixed;
  bottom: 80px;
  right: 20px;
  width: 400px;
  height: 600px;
  background-color: rgb(8, 9, 12);
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
  display: flex;
  flex-direction: column;
  overflow: hidden;
  z-index: 1000;
}

.chat-header {
  background-color: rgb(51, 153, 255);
  padding: 20px;
  height: 60px;
  display: flex;
  align-items: center;
}

.chat-title {
  color: white;
  font-size: 18px;
  font-weight: 600;
  margin: 0;
}

.messages-area {
  flex-grow: 1;
  padding: 20px;
  overflow-y: auto;
  background-color: rgb(31, 33, 46);
}

.message {
  margin-bottom: 12px;
  padding: 12px 16px;
  border-radius: 12px;
  max-width: 80%;
  word-wrap: break-word;
}

.message.bot {
  background-color: rgba(51, 153, 255, 0.1);
  color: white;
  align-self: flex-start;
}

.message.user {
  background-color: rgb(51, 153, 255);
  color: white;
  align-self: flex-end;
  margin-left: auto;
}

.input-area {
  background-color: rgb(38, 41, 56);
  padding: 10px;
  height: 60px;
  display: flex;
  align-items: center;
  gap: 10px;
}

.message-input {
  flex-grow: 1;
  height: 40px;
  padding: 0 16px;
  border: none;
  border-radius: 8px;
  background-color: rgb(46, 49, 64);
  color: white;
  font-size: 14px;
}

.message-input:focus {
  outline: none;
  background-color: rgb(51, 54, 69);
}

.send-button {
  width: 50px;
  height: 40px;
  border: none;
  border-radius: 8px;
  background-color: rgb(51, 153, 255);
  color: white;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: background-color 0.2s;
}

.send-button:hover {
  background-color: rgb(41, 143, 245);
}

.send-button svg {
  width: 20px;
  height: 20px;
}
</style> 