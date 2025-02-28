### **Why is Your SD Card Not Deleting Files? (Low-Level Explanation)**

Your SD card behaves this way because of **flash memory corruption** or **firmware-level write protection**. Let's break it down in a low-level way.

---

## **🧠 How Flash Memory Works**

SD cards use **NAND flash memory**, which stores data in small **cells** that retain charge.

- When you write a file, **electrons are trapped** in the NAND cells.
- When you delete a file, the SD card **marks the file as deleted**, but the data is still physically there until it's overwritten.

**🛠 Normally, when you delete a file:**

1. The SD card marks the space as **available**.
2. When new data is written, it **overwrites old data**.

But in your case, the files **keep reappearing** after unplugging. This means something is preventing the changes from being saved.

---

## **🔍 Possible Causes**

### **1️⃣ Your SD Card is in "Read-Only" Mode (Firmware Lock)**

Most SD cards have **firmware that can switch them into read-only mode** when they detect issues.

- The SD card **protects itself** from further writes if it detects bad memory sectors.
- This is a security feature to prevent further damage.

**How to check?**  
Run:

```bash
dmesg | tail -20
```

If you see:

```
[sdX] Write Protect is on
```

Your SD card **firmware has locked it**. You can't fix this via software.

---

### **2️⃣ NAND Flash is Worn Out (Limited Write Cycles)**

NAND flash memory has a **limited lifespan**:

- Consumer-grade SD cards can handle **10,000 - 100,000 write cycles per cell**.
- Once a cell is worn out, it becomes **read-only** and can’t be erased.

🛑 **Symptoms of NAND wear-out:**

- Files **delete temporarily** but come back after unplugging.
- Some files might be **corrupted**.
- SD card storage reports **0 bytes available** (`f3probe` showed 0 usable blocks).

💡 **Why?** Your card has **bad blocks** that can't be updated. The SD controller **reads old data from dead cells** instead of saving new data.

---

### **3️⃣ Corrupt Flash Translation Layer (FTL)**

SD cards have a small **controller chip** that manages NAND memory.  
It translates **logical file system requests** into **physical NAND operations**.

If the **FTL (Flash Translation Layer) is corrupted**, it might:

- Keep showing old data instead of deleting it.
- Fail to update new file writes.
- Be stuck in a corrupted state.

🛠 **Fix attempt:**  
Try a full low-level format:

```bash
sudo blkdiscard /dev/sdb
```

If this fails, the FTL is **permanently corrupted**.

---

### **4️⃣ Fake SD Card (Firmware Reports Wrong Size)**

Some cheap SD cards **lie about their storage size** using modified firmware.

- They **claim** to be 16GB but actually have only **2GB or less**.
- When you write beyond the real size, data **overwrites itself** and behaves weirdly.

🛠 **How to check?**

```bash
f3probe --destructive /dev/sdb
```

If it shows **0 usable blocks**, the SD card is either **fake** or **fully damaged**.

---

## **🔥 Final Verdict**

If your SD card: ✅ Is not fake  
✅ Shows **"Write Protect" in `dmesg`**  
✅ Shows **0 usable blocks in `f3probe`**

**Then the internal flash memory is dead**. This is a **hardware failure**, and no software can fix it.

### **💡 Can You Fix It?**

❌ If it’s a **firmware-level lock**, only the manufacturer can unlock it.  
❌ If NAND flash is **worn out**, it's **physically damaged** and must be replaced.  
❌ If FTL is **corrupted**, some industrial tools can rewrite the firmware, but these are not available to consumers.

### **⚡ Only Possible Hack (Extreme Method)**

If you're desperate, you can try using an **Arduino** or a low-level NAND programmer to manually read/write NAND chips, but this is **highly technical and unreliable**.

**🛑 My Recommendation:**  
Replace the SD card. Once an SD card reaches this state, it's not repairable.

---

Let me know if you want **hardware-level details** about NAND recovery! 🚀