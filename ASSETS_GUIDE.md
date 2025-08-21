# WhatsApp UI Assets List

## Required Icons (SVG format recommended)

Based on the Figma design, you'll need these specific icons:

### Navigation Icons
- **Bottom Navigation**: Chats, Updates (Status), Communities, Calls
- **Camera Icon**: For chat header and story camera
- **Search Icon**: For chat search functionality
- **More Options**: Three dots vertical menu

### Chat Interface Icons
- **Send Button**: Paper plane or arrow icon
- **Attachment**: Paperclip icon
- **Microphone**: For voice messages
- **Emoji**: Smiley face icon
- **Video Call**: Video camera icon
- **Voice Call**: Phone icon

### Message Status Icons
- **Clock**: Message sending
- **Single Check**: Message sent
- **Double Check**: Message delivered
- **Double Check Blue**: Message read

### Story/Status Icons
- **Add Story**: Plus icon or camera
- **Story Ring**: Circular border for unviewed stories

### Profile & Settings Icons
- **Profile**: Person/user icon
- **Settings**: Gear icon
- **Back Arrow**: Left pointing arrow
- **Mute**: Speaker with slash
- **Pin**: Pin icon
- **Archive**: Archive box icon

## Required Images

### Profile Pictures
You'll need placeholder profile images or use initials:
- Default profile placeholder
- Sample profile images for demo contacts

### Backgrounds
- Light theme chat background (optional pattern)
- Dark theme chat background

### Logo
- WhatsApp logo (if needed for splash screen)

## Colors from Figma Design

I've already implemented these in `AppColors` class:

### Light Theme
```dart
Primary: #00A884        // WhatsApp green
Background: #FFFFFF     // White
Chat Bubbles (Out): #D9FDD3  // Light green
Chat Bubbles (In): #FFFFFF   // White
Text Primary: #000000   // Black
Text Secondary: #667781 // Gray
```

### Dark Theme
```dart
Primary: #00A884        // Same green
Background: #0B141A     // Dark blue-gray
Chat Bubbles (Out): #005C4B  // Dark green
Chat Bubbles (In): #1F2C33   // Dark gray
Text Primary: #E9EDEF   // Light gray
Text Secondary: #8696A0 // Medium gray
```

## Next Steps

1. **Export icons from Figma** as SVG files (24x24dp recommended)
2. **Save them in** `assets/icons/` folder
3. **Add sample profile images** to `assets/images/` folder
4. **Use the color constants** from `AppColors` class
5. **Apply the themes** using `AppTheme.lightTheme` and `AppTheme.darkTheme`

## How to Export from Figma

1. Select the icon/asset in Figma
2. In the right panel, click "Export"
3. Choose SVG format for icons
4. Choose PNG/JPG for images
5. Download and place in appropriate asset folders

The asset structure and color scheme are now ready for your WhatsApp clone implementation!
