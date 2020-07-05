## __My 8-bit Gaming Console__
### __Instroduction__
This is a personal project building an early 8-bit gaming console using the book _Designing Video Game Hardware in Verilog_ by Steven Hugg, [8 bit workshop](http://8bitworkshop.com/), using the open source tools [apio](https://github.com/FPGAwars/apio) and the Upduino version 3.0 by [tinyvision.ai](https://tinyvision.ai/).

### __Setup__
To use apio to the fullest, add the following entry to your __boards.json__ file found in __Appdata->Local->Programs->Python->Python38->Lib->site-packages->apio->resources__

---

```json
  "upduino3": {
    "name": "UPduino v3.0",
    "fpga": "iCE40-UP5K-SG48",
    "programmer": {
      "type": "iceprog"
    },
    "usb": {
      "vid": "0403",
      "pid": "6014"
    },
    "ftdi": {
      "desc": "UPduino v3.0"
    }
  },
```
---

 
With apio now ready to go, you can use the commands __apio verify__, __apio build__ and then __apio upload__

To program the UPduino 3.0, use Zadig that comes with apio via the command __apio drivers --ftdi-enable__ to install appropriate USB driver.

### __notes__
SB_HFOSC was not stable enough to drive the PLL. From my research online, this is common for many boards and the best practice is to use an external crystal oscillator. The Upduino 3.0 has a very stable crystal oscillator on pin 12M.