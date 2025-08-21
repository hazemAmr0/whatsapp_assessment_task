# whatsapp_assessment_task 

A pixel-perfect WhatsApp clone built with Flutter, featuring authentic UI design and interactive functionality that closely matches the original WhatsApp.  

---

## 📱 Screenshots  

| Light Mode | Dark Mode |  
|------------|-----------|  
| ![homelight](https://github.com/user-attachments/assets/7953d384-b67a-47db-8a01-12fc9680ffb0)| ![homedark](https://github.com/user-attachments/assets/cb080f34-ec77-404a-a1bf-51c48195ac0c)|  
| ![chatlight](https://github.com/user-attachments/assets/4efc0543-f336-439a-8a99-8a79c68aeb58)| ![chatdark](https://github.com/user-attachments/assets/824b144b-1071-4eba-aefc-500fe45f0d79)|  
| ![storylight](https://github.com/user-attachments/assets/66c94b1d-0a16-4c3c-895b-e97af8243e80)| ![storydark](https://github.com/user-attachments/assets/7b4675fe-6ffd-42c4-8f2c-8a4724d793e7)
 |  
| ![storycontent](https://github.com/user-attachments/assets/4f6cb262-6fd4-40fa-b61a-754114aa39d1)


---
## 📁 Project Structure  
lib/
├── main.dart

├── models/

├── screens/

├── widgets/

├── providers/

├── services/

└── utils/
---
## ✨ Features Implemented  

### 🏠 **Home Screen (Chat List)**  
- ✅ Authentic WhatsApp app bar with camera, search, and menu icons  
- ✅ Tab navigation with Chats, Status, and Calls  
- ✅ Chat notification badge showing unread messages  
- ✅ Floating action button with context-aware icons  
- ✅ WhatsApp-style color scheme in light and dark modes  

### 💬 **Chat Screen (Conversation)**  
- ✅ Real-time message display with WhatsApp-style bubbles  
- ✅ Message timestamps and status indicators  
- ✅ Chat header with user avatar and name  
- ✅ Message input field with send button  
- ✅ **Microinteraction**: Smooth message sending animation  
- ✅ **Microinteraction**: Animated chat opening transition  

### 📖 **Stories Screen (Status)**  
- ✅ Story rings with segment indicators (1-3+ stories per user)  
- ✅ Separated "Recent updates" and "Viewed updates" sections  
- ✅ Progress indicators showing story progression  
- ✅ Tap navigation (left/right for previous/next story)  
- ✅ Long press to pause, release to resume  
- ✅ **Microinteraction**: Smooth slide transitions between users  
- ✅ Auto-progression through stories (5 seconds each)  
- ✅ User navigation with slide animations  

### 🎨 **UI/UX Excellence**  
- ✅ **Pixel-perfect accuracy** matching original WhatsApp design  
- ✅ **Authentic colors**: Exact WhatsApp green (#00A884) and proper dark mode colors  
- ✅ **Typography**: Matching fonts, sizes, and letter spacing  
- ✅ **Icons**: Authentic WhatsApp-style icons throughout  
- ✅ **Spacing**: Proper margins, padding, and component sizing  

### 🌙 **Theme Support**  
- ✅ **Light mode**: WhatsApp's signature green and white theme  
- ✅ **Dark mode**: Dark backgrounds with proper contrast  
- ✅ **Dynamic switching**: Automatic theme detection and manual toggle  
- ✅ **Persistent**: Theme preference saved across app sessions  

---

## 🛠 Technical Highlights  

- **Architecture**: Modular widgets, clean structure, separation of concerns  
- **State Management**: Provider for themes, StatefulWidgets for local state  
- **Animations**: Smooth transitions, story progress bars, message send feedback  
- **Performance**: Efficient rebuilding, optimized images, cached assets  

---
## 🚀 Getting Started  

### Prerequisites  
- Flutter SDK `>=3.24.0`  
- Dart `>=3.5.0`  

### Installation  
```bash
git clone [repository-url]
cd whatsapp_assessment_task
flutter pub get
flutter run
