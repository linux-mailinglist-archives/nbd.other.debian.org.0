Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF8412AD23
	for <lists+nbd@lfdr.de>; Thu, 26 Dec 2019 16:00:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 27A662028D; Thu, 26 Dec 2019 15:00:37 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Dec 26 15:00:37 2019
Old-Return-Path: <nsoffer@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_MED autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B65B62026C
	for <lists-other-nbd@bendel.debian.org>; Thu, 26 Dec 2019 15:00:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.501 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id L30T-VGujpsU for <lists-other-nbd@bendel.debian.org>;
	Thu, 26 Dec 2019 15:00:25 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by bendel.debian.org (Postfix) with ESMTP id DEDBB20251
	for <nbd@other.debian.org>; Thu, 26 Dec 2019 15:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577372419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+3AEsQnjw0qxT48U0QlpuQswmr6huOHGTpNQ6Gg3ULo=;
	b=RxvLS5mMkApBPxvrAgCS2+0NasdunCgrRfe4oTe1PzFH5nm+W4qyFKMN1HUZoh4nqp3D3a
	STZf/FCPchecJ4YelEVy/X8uNXz3zm62aCsAxXcYde4s7w6XpDG+bgC2+jS5UTqk1J7Rez
	vI62GgY/AfzRKwniZuRzUFq9nND+zEY=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-rTKLwLKYMgSozQ2t2MAi0A-1; Thu, 26 Dec 2019 09:29:21 -0500
Received: by mail-yb1-f200.google.com with SMTP id y18so13304738ybs.23
        for <nbd@other.debian.org>; Thu, 26 Dec 2019 06:29:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=PinwwvXrjIcgbjAdzulP8ati0mdJzt5e2Ycd854Rp+E=;
        b=ea/bGJxvIwaSYpD1uPHCTrcALW1qwAnhGYYCEqXjU/FQ3VhneHhoL4Y4d5TTDvL4NI
         EQU4vW2u917/I5c4Vrz4WLpnTnY8E5UuRhDHdMxVKYhU/I9HjF600loWeZ2s8lx2SE6X
         3tfmcT51OhvAXqF8PQyJcZmp6kdKsy8cj9FxfXKsIR8Mv7kqNRP+s3XcsQIVSyOmcYho
         9lmfaE54p9iSSi01+aQpYBZbWhCyl9vbjjVQfIv/sfeVB1QTWHNwhnN77ZnDHTJXhdBs
         Dt1duPhZu4/aDDROM6Jz2+B/WTTiKkVo+96/YTGaAoFAISsiLLqJvXRPJiQc8Ab3vxVB
         hzEQ==
X-Gm-Message-State: APjAAAXgcIpvzQPS5t6owfiAcnUWzRqFjLgASwbmxu6ZRS/qW/dmH6+Q
	ksYV0c9+beduBWk6EZBOKes0hxqMTROwB2XkEHqIDdhNciUyP1ytBH0q1g/TfMC9NUyxpgROxCT
	iL5vBXSh3G3/znEpPIu9+IEjITCTBHw==
X-Received: by 2002:a9d:5885:: with SMTP id x5mr49463298otg.132.1577370559581;
        Thu, 26 Dec 2019 06:29:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqwaKgGAdIfZUnVwUZN1cxV6QQVoguwZ3W9AfznXSS50PY1/qLFTwRp+8b95DDxQYbedD8f2BQTxeExzeegcI7s=
X-Received: by 2002:a9d:5885:: with SMTP id x5mr49463274otg.132.1577370559280;
 Thu, 26 Dec 2019 06:29:19 -0800 (PST)
MIME-Version: 1.0
From: Nir Soffer <nsoffer@redhat.com>
Date: Thu, 26 Dec 2019 16:29:03 +0200
Message-ID: <CAMRbyyv23h0nCjh3b9oWAT_XGe+0=fDanbHOuAyK=QQJGPH5Yg@mail.gmail.com>
Subject: Selecting meta context when calling NBD_CMD_BLOCK_STATUS
To: qemu-block <qemu-block@nongnu.org>, nbd@other.debian.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, Eric Blake <eblake@redhat.com>, 
	"Richard W.M. Jones" <rjones@redhat.com>
X-MC-Unique: rTKLwLKYMgSozQ2t2MAi0A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <lO0SeANQwNC.A.x9G.VsMBeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/760
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMRbyyv23h0nCjh3b9oWAT_XGe+0=fDanbHOuAyK=QQJGPH5Yg@mail.gmail.com
Resent-Date: Thu, 26 Dec 2019 15:00:37 +0000 (UTC)

Currently client need to use NBD_OPT_SET_META_CONTEXT during handshake to
select the meta context it wants to get in NBD_CMD_BLOCK_STATUS.

This means that if you want to provide the option to get both
"base:allocation" and
"qemu:dirty-bitmap:x" using the same NBD client connection, you must
pay for getting
both during NBD_CMD_BLOCK_STATUS even if the user of the NBD client is not =
going
to use both.

Or, you can use new client connection for getting meta context not
that the current
client did not select, which require server that supports multiple
connections, and new
handshake. This seems to be more complicated than needed.

This complicates existing clients:
- qemu-img can return either "base:allocation" or
"qemu:dirty-bitmap:x" using complex
  undocumentde configuration
- ovirt-imageio is using dirty flag in the client to enable both
"base:allocation" and
  "qemu:dirty-bitmap:x", so we can provide merged extents reporting
both allocation
  status and "dirtiness" for every extent.

Should we extend NBD_CMD_BLOCK_STATUS so we can specify list of meta contex=
t
at the time of the call?

Looking at command structure, I don't think it could be extended. We
need to specify
list of 32 bit context ids, so we need something like:

32 bits, length of payload (N * 4)
32 bits, contex id 1
...
32 bits, context id N

But the length field of a BLOCK_STATUS command is already used to
specify the range
of the reply.

So maybe add a new handshake flag, NBD_OPT_EXTENDED_COMMAND. If set during
handshake, and NBD_FLAG_EXTENDED is set, a command will support
additional payload
like the list of context ids.

So a BLOCK_STATUS command will look like:

C: 32 bits, NBD_REQUEST_MAGIC)
C: 16 bits, NBD_FLAG_EXTENDED
C: 16 bits, NBD_CMD_BLOCK_STATUS
C: 64 bits, 42
C: 64 bits, 0
C: 32 bits, 1073741824
C: 32 bits: 4
C: 32 bit: 1

With this the server reply will be only for context id 1.

What do you think?

Nir

