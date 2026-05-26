<template>
  <ResultOnlyScore v-if="mode !== 'full'" :paperId="paperId" />
  <ResultWithDetail v-else :paperId="paperId" />
</template>

<script lang="ts" setup>
import ResultOnlyScore from '@/views/Exam/Exam/Client/components/ResultOnlyScore.vue'
import ResultWithDetail from '@/views/Exam/Exam/Client/components/ResultWithDetail.vue'

import { useRoute } from 'vue-router'
const route = useRoute()
const paperId = route.query.id
const mode = route.query.mode
</script>
