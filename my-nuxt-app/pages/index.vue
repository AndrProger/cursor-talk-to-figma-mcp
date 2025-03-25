<template>
  <div class="landing-page">
    <nav class="navigation-bar">
      <div class="container">
        <h1 class="logo">AutoMarket</h1>
      </div>
    </nav>
    
    <main class="main-content">
      <div class="container">
        <h2 class="main-title">Найдите автомобиль своей мечты</h2>
        <p class="subtitle">Более 1000 проверенных автомобилей в нашем каталоге</p>
        <button class="search-button">Найти авто</button>
      </div>
    </main>

    <div class="decorative-wave"></div>
    
    <Chat :is-open="isChatOpen" />
    <ChatButton @toggle="toggleChat" />
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'

const isChatOpen = ref(false)

const toggleChat = () => {
  isChatOpen.value = !isChatOpen.value
}
</script>

<style scoped>
.landing-page {
  min-height: 100vh;
  background-color: rgb(8, 9, 12);
  color: white;
  position: relative;
}

.navigation-bar {
  background-color: rgb(31, 33, 46);
  height: 80px;
  display: flex;
  align-items: center;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
}

.logo {
  font-size: 24px;
  font-weight: 700;
  color: white;
}

.main-content {
  padding: 120px 0;
}

.main-title {
  font-size: 48px;
  font-weight: 700;
  margin-bottom: 1.5rem;
  max-width: 837px;
}

.subtitle {
  font-size: 24px;
  color: rgb(179, 179, 191);
  margin-bottom: 2.5rem;
  max-width: 680px;
}

.search-button {
  background-color: rgb(51, 153, 255);
  color: white;
  border: none;
  border-radius: 8px;
  padding: 0 2rem;
  height: 50px;
  font-size: 18px;
  font-weight: 600;
  cursor: pointer;
  transition: background-color 0.2s;
}

.search-button:hover {
  background-color: rgb(41, 143, 245);
}

.decorative-wave {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 105px;
  background-color: rgb(31, 36, 51);
}
</style> 