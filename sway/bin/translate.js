function TL(a) {
  var k = "";
  var b = 406644;
  var b1 = 3293161072;

  var jd = ".";
  var $b = "+-a^+6";
  var Zb = "+-3^+b+-f";

  for (var e = [], f = 0, g = 0; g < a.length; g++) {
    var m = a.charCodeAt(g);
    128 > m
      ? (e[f++] = m)
      : (2048 > m
          ? (e[f++] = (m >> 6) | 192)
          : (55296 === (m & 64512) &&
            g + 1 < a.length &&
            56320 === (a.charCodeAt(g + 1) & 64512)
              ? ((m = 65536 + ((m & 1023) << 10) + (a.charCodeAt(++g) & 1023)),
                (e[f++] = (m >> 18) | 240),
                (e[f++] = ((m >> 12) & 63) | 128))
              : (e[f++] = (m >> 12) | 224),
            (e[f++] = ((m >> 6) & 63) | 128)),
        (e[f++] = (m & 63) | 128));
  }
  a = b;
  for (f = 0; f < e.length; f++) (a += e[f]), (a = RL(a, $b));
  a = RL(a, Zb);
  a ^= b1 || 0;
  0 > a && (a = (a & 2147483647) + 2147483648);
  a %= 1e6;
  return a.toString() + jd + (a ^ b);
}

function RL(a, b) {
  var t = "a";
  var Yb = "+";
  for (var c = 0; c < b.length - 2; c += 3) {
    var d = b.charAt(c + 2);
    d = d >= t ? d.charCodeAt(0) - 87 : Number(d);
    d = b.charAt(c + 1) === Yb ? a >>> d : a << d;
    a = b.charAt(c) === Yb ? (a + d) & 4294967295 : a ^ d;
  }
  return a;
}

const http = require("http");
const readline = require("readline");
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.question("", function (text) {
  var strip_text = text.replace(/\n/g, '')
  const options = {
    hostname: "translate.google.com",
    path: `/translate_a/single?client=webapp&sl=auto&tl=zh-CN&hl=zh-CN&dt=at&dt=bd&dt=ex&dt=ld&dt=md&dt=qca&dt=rw&dt=rm&dt=ss&dt=t&source=bh&ssel=0&tsel=0&kc=1&tk=${TL(strip_text)}&q=${encodeURIComponent(strip_text)}`,
    method: "GET",
    headers: { responseType: "json" },
  };
  const req = http.request(options, (res) => {
      let data = "";
      res.on("data", (chunk) => {
        data += chunk;
      }); // Ending the response
      res.on("end", () => {
        var result = JSON.parse(data);
        var content_list = result[0];
        var final = ""
        // console.log(content_list)
        for (let index = 0; index < content_list.length; index++) {
          if (content_list[index][0] !== null) {
            final += content_list[index][0];
          } else {
            break
          }
        }
        console.log(final)
      });
    })
    .on("error", (err) => {
      console.log("Error: ", err);
    })
    .end();
});

