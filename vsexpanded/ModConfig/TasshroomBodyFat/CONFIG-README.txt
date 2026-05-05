=== TasshroomBodyFat Configuration Guide ===

Configuration file: TasshroomBodyFatConfig.json

Available settings:

1. MaxBodyFat (default: 10500)
   - Maximum amount of body fat a player can store
   - Range: 1 to 100,000
   - Higher values allow more fat storage but may impact game balance

2. DailyFatLimit (default: 500)
   - Maximum amount of fat a player can gain per day
   - Range: 1 to 10,000
   - This resets each in-game day at midnight

3. FatConversionPercent (default: 50)
   - Percentage of excess food (beyond saturation threshold) that converts to fat
   - Range: 1% to 200%
   - 100% means all excess food becomes fat, 50% means half does

4. EnableDebugLogging (default: false)
   - Enables detailed debug logging to TasshroomBodyFatDebugger.log file
   - Set to true only when troubleshooting issues
   - When false, important messages still go to the game's main log

5. MaxSaturationOverride (default: 0)
   - Manual override for max saturation detection
   - Range: 0 (auto-detect) or 100 to 10,000
   - Set to 0 to automatically detect max saturation from other mods
   - Only set a value if automatic detection doesn't work properly

6. FatConversionThreshold (default: 1.0)
   - When food starts converting to fat, as a percentage of max saturation
   - Range: 0.5 to 1.0
   - 1.0 = Start at 100% saturation (must be completely full)
   - 0.9 = Start at 90% saturation (can gain fat while slightly hungry)
   - 0.8 = Start at 80% saturation, etc.

7. StarvationConversionPercent (default: 10)
   - Percentage of current fat to convert per starvation tick (every 5 seconds)
   - Range: 1% to 100%
   - Higher values mean faster fat burning during starvation
   - 10% means convert 10% of current fat every 5 seconds when starving
   - Example: With 1000 fat and 10%, converts 100 fat per tick

7. BarPosX and BarPosY (default: -1, -1)
   - Position of the fat bar on screen
   - -1 means use automatic positioning (above saturation bar)
   - Set to specific pixel coordinates to customize position
   - Use F6 in-game to adjust position visually
   - The bar respects GUI scale settings
   - Position is saved exactly where you place it

MEAL BEHAVIOR:
With this mod, meals can now contribute to fat when your hunger is full!
- When hunger is full but fat has room: meals can be consumed, excess goes to fat
- When both hunger AND fat are full: meals are blocked (no waste)
- Setting FatConversionThreshold below 1.0 allows meals to add fat even when not completely full

Example configuration:
{
  "MaxBodyFat": 10500,
  "DailyFatLimit": 500,
  "FatConversionPercent": 50,
  "EnableDebugLogging": false,
  "MaxSaturationOverride": 0,
  "FatConversionThreshold": 1.0
}

Advanced example with early fat conversion:
{
  "MaxBodyFat": 10500,
  "DailyFatLimit": 500,
  "FatConversionPercent": 50,
  "EnableDebugLogging": false,
  "MaxSaturationOverride": 0,
  "FatConversionThreshold": 0.9
}
This would start converting food to fat when you're at 90% hunger or above.
