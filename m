Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7745D8D65D4
	for <lists+nbd@lfdr.de>; Fri, 31 May 2024 17:33:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5CAAF20587; Fri, 31 May 2024 15:33:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 31 15:33:11 2024
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,FOURLA,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CAA6D20580
	for <lists-other-nbd@bendel.debian.org>; Fri, 31 May 2024 15:18:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 5hMMQFz1Rgru for <lists-other-nbd@bendel.debian.org>;
	Fri, 31 May 2024 15:17:54 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-yw1-x1135.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id AB3F020578
	for <nbd@other.debian.org>; Fri, 31 May 2024 15:17:51 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-627f3265898so21754317b3.3
        for <nbd@other.debian.org>; Fri, 31 May 2024 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1717168668; x=1717773468; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqvRq7yENLDnnpdEq2cw3Le9KvoZpYlA6wAP6e79glQ=;
        b=e60DsE/QN5rrUK1FSdUTw7cOfZ8kafK+af0qeQ/Gw/cg0M2ZVQlMoP0ofCGcfH0bBA
         UJenKgB8YrlcIxHmbN9G1AHZSj6oKdw30xQw0kYMM9LJBY57obV5RJfSzZtGQ+RWIPh2
         3Uu+DnvXy4YlDDBvPug1Fz8JC9uz6Y1/B5/PGl3qYHfyyazsxfAgwcIJFHDv8IHH6KOJ
         /m3am2invuVdSxLuqcapLfddX2wFSNfCKI7FLwgLtA26ySLtuPFNdQyEcP+agvhO9NnC
         9sJ/IXO3QMqUY1X9YK7B6AwgLBr+84/FukpUyvM9cdN1KPVlRmXFDMMpK743pzs93MzP
         x6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717168668; x=1717773468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqvRq7yENLDnnpdEq2cw3Le9KvoZpYlA6wAP6e79glQ=;
        b=tGLUFw57bzNqCkupN5tHHSUzD5YH2IGj6yo6AtI4OKhawNP4CxT8Kk26DpHVKuX7sg
         Tw4YIGwHzOrpVGZzPxfWT70sCuz7Uf1RjriTVLrbl+qlry/685dpsQiL7nCAuSrdvY9l
         necRzZiJMv0GdD2rj0p/kNJgFlKtfLwbyNONlbtkPnihSI1wvJJ3yPfhbbM7wQuEXD8G
         Cs4CXbquw5bd3qjiE56LEo+1/OuoS+7zzziLnKUOmhnqMuikDpN876Ork+qLjUWxm1u5
         F01AMsqUj3jXne1FPMC/CX0rbKb45CuOWoFy3M9oDCS8M8Sv6F9jDeUaTLAYHQPTtACx
         AOCw==
X-Forwarded-Encrypted: i=1; AJvYcCWnzzRq3X2WOf/QT5UCiY/0yR75+UTOHDLBeBvQt10GF3yZTZKNIZ447OTysdObX6xe4lXHuuPrSecHwuKv2ULQUQJ6/A==
X-Gm-Message-State: AOJu0Yx7UZRiMCGpPDYM3gvo27HZP2boPdMG3do2rX9HMHA1kHvWn2VJ
	ztg8TT6LqI4kl4HsVkGG8VS9nWQ+U3cIJSyLDLFUEhsH/4wsuIhUM0nXQuQIXC2mPXsnhmiQUFB
	LxaD2N8U2SGgb3+d8/rNzvpQICcT2NJxdluqCuA==
X-Google-Smtp-Source: AGHT+IGoBZVRTn8ZPER/V7J2reQJ1YQXw2ghQEo3AzlqRvr5HIsKCAfC+0w/WBOKqoJQt56aaKBXQrPQC8Zk6per3zM=
X-Received: by 2002:a81:f90f:0:b0:620:33dc:8357 with SMTP id
 00721157ae682-62c79708611mr20130947b3.18.1717168668126; Fri, 31 May 2024
 08:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <6d33a50a-eea5-4a40-8976-fd6beff191ad@gmail.com> <5d188452-fe93-48b3-9eb7-e0fbcb5e3648@famille-lp.fr>
In-Reply-To: <5d188452-fe93-48b3-9eb7-e0fbcb5e3648@famille-lp.fr>
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 31 May 2024 11:17:37 -0400
Message-ID: <CAEzrpqfg6V5Pc-CcMqgceRapUWfb-HjAkFU9TUSEAoBNXbToFA@mail.gmail.com>
Subject: Re: [BUG REPORT][BLOCK/NBD] Error when accessing qcow2 image through NBD
To: Michel LAFON-PUYO <michel@famille-lp.fr>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <TgNkdAdzWjG.A.ODEP.32eWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2883
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAEzrpqfg6V5Pc-CcMqgceRapUWfb-HjAkFU9TUSEAoBNXbToFA@mail.gmail.com
Resent-Date: Fri, 31 May 2024 15:33:11 +0000 (UTC)

On Fri, May 31, 2024 at 1:48=E2=80=AFAM Michel LAFON-PUYO <michel@famille-l=
p.fr> wrote:
>
> Hi!
>
>
> When switching from version 6.8.x to version 6.9.x, I've noticed errors w=
hen mounting NBD device:
>
> mount: /tmp/test: can't read superblock on /dev/nbd0.
>         dmesg(1) may have more information after failed mount system call=
.
>
> dmesg shows this kind of messages:
>
> [    5.138056] mount: attempt to access beyond end of device
>                 nbd0: rw=3D4096, sector=3D2, nr_sectors =3D 2 limit=3D0
> [    5.138062] EXT4-fs (nbd0): unable to read superblock
> [    5.140097] nbd0: detected capacity change from 0 to 1024000
>
> or
>
> [  144.431247] blk_print_req_error: 61 callbacks suppressed
> [  144.431250] I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys=
_seg 4 prio class 0
> [  144.431254] buffer_io_error: 66 callbacks suppressed
> [  144.431255] Buffer I/O error on dev nbd0, logical block 0, async page =
read
> [  144.431258] Buffer I/O error on dev nbd0, logical block 1, async page =
read
> [  144.431259] Buffer I/O error on dev nbd0, logical block 2, async page =
read
> [  144.431260] Buffer I/O error on dev nbd0, logical block 3, async page =
read
> [  144.431273] I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 0
> [  144.431275] Buffer I/O error on dev nbd0, logical block 0, async page =
read
> [  144.431278] I/O error, dev nbd0, sector 2 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 0
> [  144.431279] Buffer I/O error on dev nbd0, logical block 1, async page =
read
> [  144.431282] I/O error, dev nbd0, sector 4 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 0
> [  144.431283] Buffer I/O error on dev nbd0, logical block 2, async page =
read
> [  144.431286] I/O error, dev nbd0, sector 6 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 0
> [  144.431287] Buffer I/O error on dev nbd0, logical block 3, async page =
read
> [  144.431289]  nbd0: unable to read partition table
> [  144.435144] I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 0
> [  144.435154] Buffer I/O error on dev nbd0, logical block 0, async page =
read
> [  144.435161] I/O error, dev nbd0, sector 2 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 0
> [  144.435166] Buffer I/O error on dev nbd0, logical block 1, async page =
read
> [  144.435170] I/O error, dev nbd0, sector 4 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 0
> [  144.436007] I/O error, dev nbd0, sector 6 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 0
> [  144.436023] I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 0
> [  144.436034]  nbd0: unable to read partition table
> [  144.437036]  nbd0: unable to read partition table
> [  144.438712]  nbd0: unable to read partition table
>
> It can be reproduced on v6.10-rc1.
>
> I've bisected the commits between v6.8 tag and v6.9 tag on vanilla master=
 branch and found out that commit 242a49e5c8784e93a99e4dc4277b28a8ba85eac5 =
seems to introduce this regression. When reverting this commit, everything =
seems fine.
>
> There is only one change in this commit in drivers/block/nbd.c.
>
> -static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
> +static int __nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
>
> +static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
> +               loff_t blksize)
> +{
> +       int error;
> +
> +       blk_mq_freeze_queue(nbd->disk->queue);
> +       error =3D __nbd_set_size(nbd, bytesize, blksize);
> +       blk_mq_unfreeze_queue(nbd->disk->queue);
> +
> +       return error;
> +}
> +
>
> To reproduce the issue, you need qemu-img and qemu-nbd. Executing the fol=
lowing script (as root) triggers the issue. This is not systematic but runn=
ing the script once or twice is generally sufficient to get an error.
>
> qemu-img create -f qcow2 test.img 500M
> qemu-nbd -c /dev/nbd0 test.img
> mkfs.ext4 /dev/nbd0
> qemu-nbd -d /dev/nbd0
> mkdir /tmp/test
>
> for i in {1..20} ; do
>      qemu-nbd -c /dev/nbd0 test.img
>      mount /dev/nbd0 /tmp/test
>      umount /dev/nbd0
>      qemu-nbd -d /dev/nbd0
>      sleep 0.5
> done
>
> Output of the script is similar to:
>
> /dev/nbd0 disconnected
> /dev/nbd0 disconnected
> /dev/nbd0 disconnected
> /dev/nbd0 disconnected
> /dev/nbd0 disconnected
> /dev/nbd0 disconnected
> /dev/nbd0 disconnected
> mount: /tmp/test: can't read superblock on /dev/nbd0.
>         dmesg(1) may have more information after failed mount system call=
.
>
> Can you please have a look at this issue?
> I can help at testing patches.
>

This is just you racing with the connection being ready and the device
being ready and you trying to mount it.  The timing has changed, if
you look at this patch that I added for blk-tests you'll see the sort
of thing that needs to be done

https://github.com/osandov/blktests/commit/698f1a024cb4d69b4b6cd5500b72efa7=
58340d05

A better option for you is to load the module with devices=3D0, and use
the netlink thing so that the device doesn't show up until it's
actually connected.  This problem exists because historically we used
the device itself to get configured, instead of a control device that
would then add the device once it is ready.  We can't change the old
way, but going forward to avoid this style of problem you'll want to
use nbds_max=3D0 and then use the netlink interface for configuration,
that'll give you a much more "normal" experience.  Thanks,

Josef

