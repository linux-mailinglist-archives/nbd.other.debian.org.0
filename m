Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB3AC9B386
	for <lists+nbd@lfdr.de>; Tue, 02 Dec 2025 11:51:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EF2C9205CA; Tue,  2 Dec 2025 10:51:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Dec  2 10:51:09 2025
Old-Return-Path: <3msAuaQkbACcVbcNDOOHUDSSLG.JRRJOHXVHUFRQWHQW.FRP@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=4.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SORTED_RECIPS,TO_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BE292205A0
	for <lists-other-nbd@bendel.debian.org>; Tue,  2 Dec 2025 10:34:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.699 tagged_above=-10000 required=5.3
	tests=[BAYES_20=-1, FROM_LOCAL_HEX=0.006,
	HEADER_FROM_DIFFERENT_DOMAINS=0.212, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
	RCVD_IN_MSPIKE_WL=-0.01, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SORTED_RECIPS=2.499,
	TO_TOO_MANY=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id CUqCdCck102T for <lists-other-nbd@bendel.debian.org>;
	Tue,  2 Dec 2025 10:34:09 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-ot1-f72.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2 RANDOM_SENDER=0.25; rate: -5.25
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id DFCCB2059A
	for <nbd@other.debian.org>; Tue,  2 Dec 2025 10:34:06 +0000 (UTC)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7c75290862cso10173127a34.2
        for <nbd@other.debian.org>; Tue, 02 Dec 2025 02:34:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764671642; x=1765276442;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LfN8gxpF4JwaNq3vwCM0IdsjKuymriFs1Gt/fEnKDNA=;
        b=pkAlfisDi/W85pLGIPCAdwIVWj4jkZsr96vCGx9mqDs9WzAbCzow1N+IPdiJoE8Piq
         JbILHjfycmKW8/5B0IfdJI2OzfXIHFnpQxDpmn13AWPBDeFLOaIvnlN9lJph1B3f6iWa
         h3HQv+aEi7JVvZTznYG3+O5ARMxWsmhDpCwl71w+CDSAQ/7f3n99+OgKOWr9AErLQ5Oz
         abecSHKKV5zvltRCIdCpZrRkLUGJdoJJfgVfxT4B9VOn/3/1fKTetM/NCtVN798N9rO3
         vZVoRDVdV1wL+RD1L/Cg7a7RY0tMnBVrXheytFKtfouuUZIlE9lNZo9GXU/tdC6mogzA
         4Xlw==
X-Forwarded-Encrypted: i=1; AJvYcCWFCXqPoca1V8G0n5j+DLGHMSep3xUI2BCFQFj0fndIVDYMe5HaVMST+KTmz/SZORoDIr0=@other.debian.org
X-Gm-Message-State: AOJu0YxI5lRCMe25hxrt0fWaU58Bnl51YLywrbm1G4R3wYDhAELnb4sG
	5+uxOe2I04M72fxJfe4pFiolG20wp2ose3fvIm7UWSKymAEb6mXG66pJ3/cgR7QZAxg3/1AiZo9
	Jhj1FMoJhGbznw6ZdoM993d4BQSlQ0rMthK4ZLotoGh/Js15btopwihRSREs=
X-Google-Smtp-Source: AGHT+IFVyTV8gUu/dXx11GwznuGJ1ta4TZwhtyWteyov52sy/DWthwn2StePtK2U5WLbB956bK5YiC8bXoCRqDF2vj/pfLG6iXtf
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2225:b0:43d:6a69:7752 with SMTP id
 5614622812f47-4514e5f9427mr14895193b6e.2.1764671642291; Tue, 02 Dec 2025
 02:34:02 -0800 (PST)
Date: Tue, 02 Dec 2025 02:34:02 -0800
In-Reply-To: <688b0ef3.a00a0220.26d0e1.0038.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <692ec09a.a70a0220.d98e3.019a.GAE@google.com>
Subject: Re: [syzbot] [udf?] WARNING in __getblk_slow
From: syzbot <syzbot+89fa933c2012e808890e@syzkaller.appspotmail.com>
To: axboe@kernel.dk, edumazet@google.com, jack@suse.com, josef@toxicpanda.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nbd@other.debian.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <K8AtA_iTBFN.A.2BYG.dSsLpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3477
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/692ec09a.a70a0220.d98e3.019a.GAE@google.com
Resent-Date: Tue,  2 Dec 2025 10:51:09 +0000 (UTC)

syzbot suspects this issue was fixed by commit:

commit 9f7c02e031570e8291a63162c6c046dc15ff85b0
Author: Eric Dumazet <edumazet@google.com>
Date:   Tue Sep 9 13:22:43 2025 +0000

    nbd: restrict sockets to TCP and UDP

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16a5e512580000
start commit:   ced1b9e0392d Merge tag 'ata-6.17-rc1' of git://git.kernel...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=a6d3e67bfa86ec9a
dashboard link: https://syzkaller.appspot.com/bug?extid=89fa933c2012e808890e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11da74a2580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12af8cf0580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: nbd: restrict sockets to TCP and UDP

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

