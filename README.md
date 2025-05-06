# 🌈 Bolado — Colorful World Game

[🎥 Assista ao jogo!](https://youtu.be/ZPTJcxwiSbo)

**Bolado** é um jogo de mundo colorido onde você joga como um personagem encarregado de trazer cores a um mundo preto e branco. Cuidado com os autoproclamados **"whities"**, que não gostam da transformação colorida! Use o mouse para desviar deles e dar vida ao mundo.

---

## 🗂️ Arquivos e Componentes
📂 Bolado/
├── main.lua
├── 📂 components/
│ ├── Enemy.lua
│ └── Button.lua
├── 📂 sounds/
│ ├── menu.ogg
│ ├── game.ogg
│ ├── win.ogg
│ └── lost.ogg

markdown
Copiar
Editar

- **`main.lua`**  
  Ponto de entrada principal do jogo. Gerencia os estados do jogo, as interações do jogador e as atualizações. Responsável pelo loop de gameplay e pelos estados: menu, configurações, jogando, fim de jogo, vitória e créditos.

- **`components/Enemy.lua`**  
  Define a classe *Enemy*, que representa os inimigos do jogo. Contém métodos de movimentação, detecção de colisão e renderização.

- **`components/Button.lua`**  
  Define a classe *Button*, que cria botões interativos no jogo. Possui métodos para detectar cliques e executar funções associadas.

- **`sounds/`**  
  Contém os arquivos de som para diferentes estados: menu, jogo, vitória e derrota. Esses sons enriquecem a experiência e a ambientação.

---

## 🎨 Decisões de Design

- **📦 Estrutura Modular**  
  O código está organizado em arquivos e pastas separados para melhor legibilidade e manutenção.

- **🎮 Estados de Jogo**  
  O fluxo do jogo é controlado por estados (menu, configurações, jogando, etc.) usando a função `changeGameState` para transições suaves.

- **🖱️ Interação com Botões**  
  A classe *Button* permite criar e gerenciar botões de forma reutilizável, melhorando a experiência do usuário.

- **🎵 Música e Som**  
  Trilha sonora e efeitos sonoros imersivos variam conforme o estado do jogo, enriquecendo a atmosfera.

---

## ▶️ Como Jogar

1. **Execute o jogo com o framework Love2D.**
2. **No menu do jogo**, você pode:
   - Iniciar o jogo
   - Acessar configurações
   - Ver créditos
   - Sair do jogo
3. **Use o mouse** para controlar o personagem e desviar dos *whities*.
4. **Colete pontos** e avance pelos níveis, enfrentando novos desafios.
5. **Ganhe o jogo** ao atingir a pontuação necessária ou **perca** se for capturado.
6. **No menu de configurações**, ajuste o volume, mude a cor do personagem, alterne o modo tela cheia ou retorne ao menu principal.

---

## 👨‍💻 Créditos

Jogo criado por **Gabriel Seixas**.  
Obrigado por jogar e por ajudar a colorir o mundo! ✨
