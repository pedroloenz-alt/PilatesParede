# Clone Completo do Funil - Desafio Pilates na Parede

Este pacote contém o clone 100% idêntico e fiel do funil completo do quiz de Pilates na Parede (`https://www.desafiopilates.com/q/simple`), com todos os scripts, estilos CSS, fontes e 138 imagens/vetores originais preservados sem alteração de links, rotas ou lógicas internas.

---

## 📁 Estrutura de Arquivos

```text
├── index.html                   # Página principal do quiz (SSR original Next.js)
├── quiz-config.json             # Estrutura JSON completa extraída das 77 etapas do funil
├── iniciar_servidor.bat         # Script para rodar localmente com 1 clique (porta 3000 ou 8080)
├── q/
│   └── simple/
│       └── index.html           # Rota idêntica /q/simple para servidores que mapeiam diretórios
├── quiz-assets/                 # Todos os 138 assets originais (fotos, ícones, ilustrações, reviews)
│   └── simple/
│       ├── e01 a e73/           # Imagens organizadas por etapa do funil
│       └── results/             # Fotos de alunas (depoimentos de antes/depois)
└── _next/                       # Build estático do Next.js
    └── static/
        ├── chunks/              # Bundles JavaScript (React, Webpack, QuizRunner)
        ├── css/                 # 3 folhas de estilo completas do funil
        ├── media/               # Fontes originais WOFF2
        └── 9BLXoN3wLpfQAmPrrDSqF/ # Manifestos de rota e compilação Next.js
```

---

## 🚀 Como Executar Localmente

### Opção 1: Com 1 Clique (Windows)
Dê um duplo clique no arquivo **`iniciar_servidor.bat`**.
- O script iniciará um servidor HTTP local nativo via PowerShell na porta `3000` (ou `8080`) e abrirá seu navegador padrão automaticamente.

### Opção 2: VS Code (Live Server)
Abra esta pasta no VS Code e clique em **"Go Live"** com a extensão Live Server.

### Opção 3: Node.js / NPM
```bash
npx serve .
```

### Opção 4: Python
```bash
python -m http.server 3000
```

### Opção 5: Hospedagem Web (Vercel, Netlify, cPanel, Apache, Nginx)
Basta subir todos os arquivos para a raiz do seu domínio ou subpasta no servidor web.

---

## 🔍 Engenharia Reversa da Arquitetura do Funil

### 1. Motor de Execução (`QuizRunner`)
O quiz foi construído em **Next.js (App Router)** com React. Ele utiliza uma máquina de estados central (`QuizRunner`) alimentada por um objeto de configuração unificado passado no SSR payload.

### 2. O Arquivo `quiz-config.json`
O arquivo `quiz-config.json` contém toda a definição de dados do funil em formato limpo e legível:
- **`totalPhases`**: `3` (Fase 1: Meu Perfil, Fase 2: Meu Plano, Fase 3: Estilo de Vida & Saúde).
- **`steps`**: Array com **77 etapas** completas.
- **`brand`**:
  - `logoText`: `"PILATES NA PAREDE"`
  - `productName`: `"Pilates contra a parede"`
- **`checkoutUrl`**: `"https://wvltrack.com/t/obqtdteste"`
- **`backRedirectUrl`**: `"https://wvltrack.com/t/teste-backredirect"`

### 3. Tipos de Componentes Utilizados nas 77 Etapas

| Tipo | Quantidade | Descrição |
| :--- | :---: | :--- |
| `sp-landing` | 1 | Tela inicial de seleção de idade (18-29, 30-39, 40-49, 50+) |
| `sp-single` | 25 | Perguntas de escolha única com ou sem ícones |
| `sp-multi` | 11 | Perguntas de múltipla escolha (zonas-alvo, hábitos, alimentação) |
| `sp-image-grid` | 3 | Grids visuais de silhueta corporal atual e corpo desejado |
| `sp-measure` | 3 | Inputs dinâmicos de medidas (altura, peso atual, peso desejado com cálculo de IMC) |
| `sp-exercise-rating` | 4 | Avaliação interativa de exercícios (alongamento, afundo, agachamento) |
| `sp-statement` | 3 | Telas de identificação com dores/afirmações |
| `sp-info` | 12 | Telas informativas de reforço positivo e validação emocional |
| `sp-chart-info` | 2 | Gráficos de elegibilidade e níveis de energia |
| `sp-processing` | 4 | Animações de carregamento ("Analisando respostas...", cálculo de plano) |
| `sp-checkpoint` | 1 | Resumo do ponto de partida do aluno |
| `sp-plan-details` | 1 | Resumo personalizado de intensidade e frequência |
| `sp-blockers` | 1 | Gráfico de bloqueadores de perda de peso |
| `sp-email` | 1 | Captura de lead (e-mail) |
| `sp-before-after` | 1 | Projeção visual de antes e depois |
| `sp-name` | 1 | Captura do nome do usuário |
| `sp-plan-projection` | 1 | Tela de processamento final com o nome da usuária |
| `sp-welcome` | 1 | Tela de boas-vindas com personalização |
| `sp-offer` | 1 | Página de vendas final completa (oferta, raspadinha, depoimentos, checkout) |

### 4. Oferta Final (`sp-offer` - Etapa 76)
- **Título**: "GARANTA SEU PLANO PESSOAL — AGORA 75% OFF!"
- **Preço**: De R$ 97,90 por **R$ 27,90** (pagamento único vitalício).
- **Gatilhos Mentais**:
  - Cronômetro regressivo de 600 segundos (10 minutos).
  - Pop-up com raspadinha interativa revelando cupom de 75% OFF.
  - Comparativo: "Dietas restritivas" vs "Programa Pilates na Parede".
  - Depoimentos reais de alunas (Márcia R., Ana Paula T., Agatha L.) com fotos e perda de peso (-5kg, -7kg, -9kg).
  - Garantia incondicional de 90 dias com reembolso total.
  - Ícones de segurança e métodos de pagamento (Google Pay, Visa, Mastercard, Maestro, Elo, Android Pay).
  - Redirecionamento de saída (Back-Redirect).
