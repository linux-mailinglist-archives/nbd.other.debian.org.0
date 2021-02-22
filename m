Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B9D3220C0
	for <lists+nbd@lfdr.de>; Mon, 22 Feb 2021 21:21:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 79B5F202C1; Mon, 22 Feb 2021 20:21:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 22 20:21:09 2021
Old-Return-Path: <3dQ40YAkbAGoaghSITTMZIXXQL.OWWOTMcaMZKWVbMVb.KWU@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.6 required=4.0 tests=DIGITS_LETTERS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,TO_TOO_MANY autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B15EB20301
	for <lists-other-nbd@bendel.debian.org>; Mon, 22 Feb 2021 20:05:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.274 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FROM_LOCAL_HEX=0.006,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id AiE9pttqk4-C for <lists-other-nbd@bendel.debian.org>;
	Mon, 22 Feb 2021 20:05:15 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-io1-f71.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2 RANDOM_SENDER=0.25; rate: -5.25
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id EBCC2202E4
	for <nbd@other.debian.org>; Mon, 22 Feb 2021 20:05:12 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id s5so3327359ioc.22
        for <nbd@other.debian.org>; Mon, 22 Feb 2021 12:05:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=pLRhfTwy0FUDr6U+czrEs8kT0CiU0z5KeTk0hw3Qk44=;
        b=uNxyaPbLePYDuJwu8YidEBME+uKqZRVCH47yHwoL4BNR5TmigVQ8/Swc9dRizPO2Pd
         h5SJanN5EMmTEZP0pNOUpeFtzwBikIOOg0HAGV/1EYjXQ8C2QWxy2jBOVu+FqYg80fry
         S1/L66yJjnWx9di0dlKaMV3DiysuSHnr9C+38okyy2kYTTbcnH1sRI3rBWj7snlmXMv8
         UW5JBfJtrXl8OVvx/YfYoSHrayDtZkzf30p0qwBsq+J/iNvK4e8D1PiniSZOVxjIxMFc
         /m5ksy99L6Y4bXGZQ3bSLVoA3Gnde9nr8/yGcU/WOkjRONqBbdJz7/ZqL2EbrIM0jJbc
         YDJQ==
X-Gm-Message-State: AOAM530kOBHpHht3FLzyaq3ibSJiDKzdE3WNJ62lHWsidtCST86gogsq
	5C3R2/7PlNDDJvucYljgXi1203MuZFgVVOEenXN845U10bSC
X-Google-Smtp-Source: ABdhPJwszLmEf05WJAk7l0wSG1p+UlAXJeVI4fkex5PIO3u7zUVcnSOF4SeEDaLWNi51O4a7o1C+CBhUI8f7on020bFHQ1vhJh9q
MIME-Version: 1.0
X-Received: by 2002:a5e:8615:: with SMTP id z21mr9597031ioj.132.1614024309299;
 Mon, 22 Feb 2021 12:05:09 -0800 (PST)
Date: Mon, 22 Feb 2021 12:05:09 -0800
In-Reply-To: <49ac93fc-57b0-1f94-c43e-f9ab9a3913af@toxicpanda.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009d5c1205bbf251b9@google.com>
Subject: Re: KASAN: use-after-free Read in nbd_genl_connect
From: syzbot <syzbot+429d3f82d757c211bff3@syzkaller.appspotmail.com>
To: axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4ORAwVBoMd.A.YhB.1IBNgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1144
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/0000000000009d5c1205bbf251b9@google.com
Resent-Date: Mon, 22 Feb 2021 20:21:09 +0000 (UTC)

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+429d3f82d757c211bff3@syzkaller.appspotmail.com

Tested on:

commit:         2b31ee47 nbd: handle device refs for DESTROY_ON_DISCONNECT..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/josef/btrfs-next.git nbd-kasan-fix
kernel config:  https://syzkaller.appspot.com/x/.config?x=8ff2a923e3615ffe
dashboard link: https://syzkaller.appspot.com/bug?extid=429d3f82d757c211bff3
compiler:       

Note: testing is done by a robot and is best-effort only.

