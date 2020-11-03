Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A992A3DC9
	for <lists+nbd@lfdr.de>; Tue,  3 Nov 2020 08:39:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A2B87206C7; Tue,  3 Nov 2020 07:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov  3 07:39:09 2020
Old-Return-Path: <tom.leiming@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SORTED_RECIPS autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2756C20563
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Nov 2020 07:22:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.4 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SORTED_RECIPS=2.499]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id BYBUsq7pOsti for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Nov 2020 07:21:57 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 71E512050D
	for <nbd@other.debian.org>; Tue,  3 Nov 2020 07:21:54 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id a4so13955742ybq.13
        for <nbd@other.debian.org>; Mon, 02 Nov 2020 23:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ebOQ9Je52Ez30DqwtDrcVUKFemUvVML69F1lmPNTVIw=;
        b=I/e9geNV9tzU8CIkTqKuEmOIsZYCWKKGd+WCtCpSgPxrxlQw4E6++PFFS8LYwGktEq
         FCcFyHXaEbuuxayyqd4kgEdAcUc/X+wdXHQ6mpnVTTXfkf0Qu7Ko4p2XkuGSMsqRcYWX
         0WT1z7eI28uc/Y2LP8IyBvvq3eH92GMeFfGCt1S+PBNr5aoBh6/DH/e7l8m2Tj7P9u+M
         MSEv9l+EPUdUWY5b1IVtBML9fXje1Yr95BVaFWX1B9skdNjICVy3zaetSgLrGG+B3r5X
         PAaysuWe09a5Rc7C+8j59/aI8zq3lV7LpgMV/4GkoZgh51emuVF3HRr7a6TP0tWug9yo
         WPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ebOQ9Je52Ez30DqwtDrcVUKFemUvVML69F1lmPNTVIw=;
        b=VUeoSJivdnf3wlZqc/aMiSJNimfV9C64kGyhj+2nZhKGz8FwGM34qwu7rROLnSjXlS
         hIPNaeLL1thSXl89bMTIdEGIE/Ttq2FUNHGcHI8k1uKCeXguKQ9cL85ITxDUHH72J5zX
         kK005yeoumNGQSYJBdoiOZCmqQS1epp6zpF/Lt4Q7UlOsdLol72JbM5mFmBKLqESo7rE
         OyUVVJ5dwJpomvvLdOr7vMe6uPnYFN+rbTcCZKEUlLF6oS0m0/fLk3YWfgIdw+wzNk5R
         T5rgIIxceuzB51p6/OVK5q8nlqYvvUFrw5Z9fQkeAA4i30Iukh7n8/3fcLY7FFDeh4EG
         Ob9A==
X-Gm-Message-State: AOAM532wW0mYj2DztN7h3JbjXi4GwZoMhNsbZNB4NjZcihaMa3nZi9Vw
	YULZsAvqgwjC1OqifQLIxahbkyW+ur8ymEmfz/c=
X-Google-Smtp-Source: ABdhPJzFEfGhyvQoxfMBw2GldYklK5VyOgWqObaAubmsY18xxv3SgrXeZt50AZbkDYLWVmrCbfDK0EgQo8aM14ondg8=
X-Received: by 2002:a25:2d01:: with SMTP id t1mr28378049ybt.50.1604388111314;
 Mon, 02 Nov 2020 23:21:51 -0800 (PST)
MIME-Version: 1.0
References: <00000000000061316205b0e750fc@google.com> <0000000000004cb88b05b2e8d1b4@google.com>
In-Reply-To: <0000000000004cb88b05b2e8d1b4@google.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Tue, 3 Nov 2020 15:21:40 +0800
Message-ID: <CACVXFVNk9Os+2Bzht+eoeFZr=E-FCBZg2SSYx5AP_eu_-3zF3w@mail.gmail.com>
Subject: Re: INFO: task can't die in nbd_ioctl
To: syzbot <syzbot+69a90a5e8f6b59086b2a@syzkaller.appspotmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, 
	linux-block <linux-block@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zIgCV0v1NYP.A.q9C.dkQofB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1035
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACVXFVNk9Os+2Bzht+eoeFZr=E-FCBZg2SSYx5AP_eu_-3zF3w@mail.gmail.com
Resent-Date: Tue,  3 Nov 2020 07:39:09 +0000 (UTC)

On Sat, Oct 31, 2020 at 4:01 AM syzbot
<syzbot+69a90a5e8f6b59086b2a@syzkaller.appspotmail.com> wrote:
>
> syzbot has found a reproducer for the following issue on:
>
> HEAD commit:    4e78c578 Add linux-next specific files for 20201030
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=158c1798500000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=83318758268dc331
> dashboard link: https://syzkaller.appspot.com/bug?extid=69a90a5e8f6b59086b2a
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15e051a8500000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15bf75b8500000

Not reproduce this issue by above C reproducer with the kernel config
in hours running
on linus tree.

Thanks,
Ming Lei

