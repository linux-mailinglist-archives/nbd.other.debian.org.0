Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6D12B1B19
	for <lists+nbd@lfdr.de>; Fri, 13 Nov 2020 13:27:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E9F73203F0; Fri, 13 Nov 2020 12:27:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Nov 13 12:27:08 2020
Old-Return-Path: <dvyukov@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,GMAIL,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 04C91203F1
	for <lists-other-nbd@bendel.debian.org>; Fri, 13 Nov 2020 12:10:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.101 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_MED=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, GMAIL=1, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uFhZ4SIH2yoR for <lists-other-nbd@bendel.debian.org>;
	Fri, 13 Nov 2020 12:10:25 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-qv1-xf44.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5A916203CA
	for <nbd@other.debian.org>; Fri, 13 Nov 2020 12:10:22 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id e5so4442175qvs.1
        for <nbd@other.debian.org>; Fri, 13 Nov 2020 04:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iiehXoilaLcjVL9BlBQaNhTaAJDG9nqqIO0TWMbl7mA=;
        b=B07q5E3cb5/mB7Ld7CNt3Vbvde8zMncRaosaJDlZv6Vt864LjakgIYDon/9ubBonvg
         MO3dfCIP5RFXoUEuTnK7p8eV0NxSxk1WH1Oa0YEVRaifFQE/SkBLrhNubfN70NR24tVd
         D9m5jD86WUrSyzE6XiabBxQIrGVN34QmK0s6i0KeMXu+JwDjPh2iF2jRylV3bjBlmq17
         jge0XZ+wdtj6d0xSME6wxs+eY8E6end4ZX1KPOZSaD6XPoYcKtRYRbKQwwDNnOsKS4p4
         sGxcLt+g5Kc2UZNxyhcQYCU5nnMlVoyrUE4ilHTXS9cc+ImaVSEHK0wNnztoDxy4E/7H
         ihnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iiehXoilaLcjVL9BlBQaNhTaAJDG9nqqIO0TWMbl7mA=;
        b=W76D91XSdzjxTXcePTy1T3+M1tqpaDHWLYuafyMqbmaawa2DvxpCx0g+6DuyBAAH0b
         er21Vce95kOwL06mNKcmAym3Z/tVy64zxQ2FXPyYJWpWNX8epushR3kWqw9lUTSzW0n7
         WkoVLmRjmbWH21Qcv7ZhXuiDelS3IT5V4UqXeG+Ne3NnEyYDcrY1C1JJIkiqinCczlFS
         DNbxi4eM1ni3fx1OvEi1z2HJ+/xnD4ZZrVIvSMPHoRcpHxFAvTlvDY6+yTNpMNM6cPUy
         PEiI2RL0YgVeMqpJIHoi+6nIyzRN8Pez7G00F1rIRGdRSLAcETJ79WXh/Rm+VYfryVi3
         BTiQ==
X-Gm-Message-State: AOAM531rZMuigRtbdgCiRK7/h/Fwycwd6IcUwLD8ql9v1E4bGgooOmq+
	F1ax+GKSkK7lD2xtIUBwnIaGHuq8KksEAJMi0Pnjkw==
X-Google-Smtp-Source: ABdhPJz0bG9vUG7cborAESnk3G+Mfz2v/pDLuOMyNrvdaU6cKXA9OkAgDWAnWlxShWUS3ojvDZ7hgvRtw5w5WSbreCg=
X-Received: by 2002:a0c:e911:: with SMTP id a17mr2006226qvo.18.1605269418352;
 Fri, 13 Nov 2020 04:10:18 -0800 (PST)
MIME-Version: 1.0
References: <00000000000061316205b0e750fc@google.com> <0000000000004cb88b05b2e8d1b4@google.com>
 <CACVXFVNk9Os+2Bzht+eoeFZr=E-FCBZg2SSYx5AP_eu_-3zF3w@mail.gmail.com>
In-Reply-To: <CACVXFVNk9Os+2Bzht+eoeFZr=E-FCBZg2SSYx5AP_eu_-3zF3w@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 13 Nov 2020 13:10:06 +0100
Message-ID: <CACT4Y+YrLRueFzXqNrWcy5ic-TsAJz393G+fg_4x1zfMo061oQ@mail.gmail.com>
Subject: Re: INFO: task can't die in nbd_ioctl
To: Ming Lei <tom.leiming@gmail.com>
Cc: syzbot <syzbot+69a90a5e8f6b59086b2a@syzkaller.appspotmail.com>, 
	Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, 
	linux-block <linux-block@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, nbd@other.debian.org, 
	syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <12Jx5hJBawH.A.P7G.cunrfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1066
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACT4Y+YrLRueFzXqNrWcy5ic-TsAJz393G+fg_4x1zfMo061oQ@mail.gmail.com
Resent-Date: Fri, 13 Nov 2020 12:27:08 +0000 (UTC)

On Tue, Nov 3, 2020 at 8:21 AM Ming Lei <tom.leiming@gmail.com> wrote:
>
> On Sat, Oct 31, 2020 at 4:01 AM syzbot
> <syzbot+69a90a5e8f6b59086b2a@syzkaller.appspotmail.com> wrote:
> >
> > syzbot has found a reproducer for the following issue on:
> >
> > HEAD commit:    4e78c578 Add linux-next specific files for 20201030
> > git tree:       linux-next
> > console output: https://syzkaller.appspot.com/x/log.txt?x=158c1798500000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=83318758268dc331
> > dashboard link: https://syzkaller.appspot.com/bug?extid=69a90a5e8f6b59086b2a
> > compiler:       gcc (GCC) 10.1.0-syz 20200507
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15e051a8500000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15bf75b8500000
>
> Not reproduce this issue by above C reproducer with the kernel config
> in hours running
> on linus tree.

Let's see how reproducible this is by syzbot:

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git
4e78c578

