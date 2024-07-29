Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FC993F9C8
	for <lists+nbd@lfdr.de>; Mon, 29 Jul 2024 17:45:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 421582088B; Mon, 29 Jul 2024 15:45:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul 29 15:45:12 2024
Old-Return-Path: <cipkuehl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3019820869
	for <lists-other-nbd@bendel.debian.org>; Mon, 29 Jul 2024 15:28:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.099 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id txI-KPkXMQrY for <lists-other-nbd@bendel.debian.org>;
	Mon, 29 Jul 2024 15:28:39 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D572520844
	for <nbd@other.debian.org>; Mon, 29 Jul 2024 15:28:39 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1fc49c0aaffso19369045ad.3
        for <nbd@other.debian.org>; Mon, 29 Jul 2024 08:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722266916; x=1722871716; darn=other.debian.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTVQgRhl0pd1/+J+vt0YACXYBY1yQgtsHBbDa2uu3MI=;
        b=aELyJlKdaZESWVDrpgxgFuY+rGRK9rzj265hycYocvcjRBe7x/ZVz2VV6Qp/rCBehl
         4XqOPnH9hsPK9ds3JuEV21nkG6GOWngRtHpGHCIO4ivhAqzN1ipb9yKztA+KK+pfcHHq
         PIJK5/NS73/Qa+1Z1zJ7aAPFLSKJzn6SUNEcDXCVwws3C8FnrqMXzUjbKyji5dxl3Dol
         OD/Ri6TYsbik7+1caV+nOuGxfpbDNFhoBM+i/YFsXK+NRFnNInrlvJTf3Lcvr7K8hjf3
         n/QL8KcCy3runtOnLUiG7W0G3FzQ4VoEp4YRKnS8OGJU2I/Okq9oUW0Y7n3IQ2FDbTlb
         EW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722266916; x=1722871716;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTVQgRhl0pd1/+J+vt0YACXYBY1yQgtsHBbDa2uu3MI=;
        b=eaHoRdkvn82jUc4qLvZclwjI54VEOJZCsl3OvB4nJl7nse1afrN4zPuv2W99Njr/Km
         rBQVNF/9teYdQSVDfULWof77bsJq02etbPJ0whloLEkGB9Q5qksyLpQw8kgr8zSZmoBi
         OI4pm9jt+AbBjy4SpHDjWg8JQnbBMzBrsuieESNRrf4wyQdnG84xVNV+Rl+i1BETwHRM
         MnDhjXt68WxN2aDh/OoxNnU8RmIp0NKGS220da8ZI9bfbNkKAPDXZFopyoj8QZMtqR4n
         XVSjicHfBZhpM/BflVztS9yaLJ2zAg6SPikBTMYd73u9comKJ4bDW8JZrWQmsZ3AnLcC
         PJmg==
X-Gm-Message-State: AOJu0YxNEe+jDs3t9z8evd5kxLpX6cXeNsAfV+p0YiClBpgk6/6s0gAh
	Tp5kpMTjmqIh7mYpSJnWf6kxZ7oNUn/Y6DUfMIaIBl3IZofQkhy0
X-Google-Smtp-Source: AGHT+IH8Uw/IkYpSXadJcw9B5k5gQyqTbTvASM2QmsC6qYV1T7afDyYbIJ7ESBdVohbREp/1+yN/7Q==
X-Received: by 2002:a17:902:e88a:b0:1fc:327a:1f48 with SMTP id d9443c01a7336-1ff047e46f2mr62224685ad.12.1722266915886;
        Mon, 29 Jul 2024 08:28:35 -0700 (PDT)
Received: from smtpclient.apple ([50.53.88.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ca8fd5sm84287965ad.64.2024.07.29.08.28.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2024 08:28:35 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: Status flags definition for NBD_REPLY_TYPE_BLOCK_STATUS
From: Connor Kuehl <cipkuehl@gmail.com>
In-Reply-To: <wljfepvxq7arxc5aawbrxuw55igjyxpdrgyqlvzonvkpdt3pef@axbpgnpevxgi>
Date: Mon, 29 Jul 2024 08:28:24 -0700
Cc: nbd@other.debian.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E805E44E-0595-44AB-BEB6-B696C506560E@gmail.com>
References: <2B83C3DC-D923-4D9C-94C3-66336F41FB2E@gmail.com>
 <wljfepvxq7arxc5aawbrxuw55igjyxpdrgyqlvzonvkpdt3pef@axbpgnpevxgi>
To: Eric Blake <eblake@redhat.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <boX5Bj7G3qB.A.dhoE.Ik7pmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3110
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/E805E44E-0595-44AB-BEB6-B696C506560E@gmail.com
Resent-Date: Mon, 29 Jul 2024 15:45:12 +0000 (UTC)


> On Sat, Jul 27, 2024 at 08:02:35PM GMT, Connor Kuehl wrote:
> > >   32 bits, length of the extent to which the status below
> > >      applies (unsigned, MUST be nonzero) =20
> > >   32 bits, status flags =20
> >=20
> > I can't seem to find the definition for these status flags. It's =
likely
> > I may have just missed it. Any pointers will be much appreciated.
>=20
> The status flags are defined per-metacontext.  The spec defines the
> "base:allocation" metacontext:
>=20
> =
https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md#baseall=
ocation-metadata-context
>=20
> which in turn defines flag 0x01 for NBD_STATE_HOLE (clear by default
> or if the extent is known to be allocated, set only if the extent is
> known to be unallocated), and flag 0x02 for NBD_STATE_ZERO (clear by
> default or if the extent is known to contain non-zero data, set only
> if the extent is known to read as zero).
>=20
> If you are implementing NBD_BLOCK_STATUS on top of files,
> lseek(SEEK_HOLE) can be used to set NBD_STATE_HOLE|NBD_STATE_ZERO in
> parallel (either both bits are clear or both bits are set).  But there
> are some other storage mechanisms where the distinction between bits
> is meaningful (for example, iSCSI has the notion of some hardware that
> supports the notion of allocation but does not promise whether
> unallocated regions read as zero; conversely, qcow2 files have a
> notion of regions of a disk image that read as zero but which are
> already allocated so that writing to those regions won't expand the
> qcow2 file size).
>=20
> There are other defined metacontexts linked from the NBD spec; in
> particular, QEMU defines two metacontexts at
> =
https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/nbd.txt
>=20
> where "qemu:dirty-bitmap:XXX" defines 0x01 to be set if an extent is
> known to be dirty in the bitmap named XXX, and where "qemu:allocation"
> is an integer representing the depth of where the allocation comes
> from (0 for unallocated, 1 for the current image, 2 for the first
> backing layer, 3 for the second backing layer, and so forth).

Aha! Thank you very much for the doc reference and the detailed
explanation. My main goal was to provide a higher level abstraction for
interpreting and using the values returned by the BLOCK_STATUS command.

In any case, I can still define these as constants to make life easier
for the library's clients, especially if they are primarily interested
in "base:allocation" and "qemu:dirty-bitmap", as I am.

> There may be other NBD metacontexts out there, but so far, none of
> them have submitted a patch to be included in the mention from the NBD
> spec.  One proposal that I have considered (but have not actually
> coded up) would be a series of NBD metacontexts allowing the ability
> to expose Zoned Block Devices (ZBD,
> https://zonedstorage.io/docs/linux/overview) across NBD; in
> particular, this would include metacontexts that reveal information
> such as the current 64-bit append location within a given zone
> (getting 64-bit block status would require the use of extended
> headers, currently mentioned as experimental in spec but currently
> implemented by qemu and libnbd).

Very interesting! As mentioned above, "base:allocation" and
"qemu:dirty-bitmap" are top of mind for me today, but I'll check up on
ZBD just out of curiosity. For now, I am targeting the base NBD
protocol, but I may end up implementing the documented extensions.

> For what it's worth, the nbdkit project can be used for testing
> interoperability with your client implementation (among other things,
> nbdkit provides it easy to write a shell script server that advertises
> various block status combinations for "base:allocation" for testing
> how your client reacts).  To date, no one has contributed patches to
> nbdkit to support the emulation of any NBD metacontext other than
> "base:allocation", but if it would help integration testing, that may
> be a worthwhile feature to add to nbdkit.
> https://libguestfs.org/nbdkit.1.html

Yes! I was planning on using nbdkit as the basis of my integration
testing.

> I can also point you to the libnbd project that may serve as a way to
> incorporate an existing client implementation into your project rather
> than writing a client from scratch.
> https://libguestfs.org/libnbd.3.html

On the one hand I'd love to use an off-the-shelf, battle-tested, and
mature implementation, but on the other hand I wouldn't learn nearly as
much! lol

I did seriously consider it, but I am writing my client implementation
in the Go programming language, and I would like to avoid a CGO/FFI
dependency since those tend to complicate multi-platform builds for the
usual suspects, adds a system dependency to the deployment target, and
Go's runtime behavior when interacting with the FFI is somewhat strange
and slow.

There are some other Go projects in this space, but the ones I have
found all seem to be some combination of:

* Abandoned and implements only one or two parts of the client protocol,
  mainly just opening a TCP connection and one or two NBD option verbs
* Focused exlusively on creating NBD servers, or /dev/nbdX devices
* Depend on CGO/FFI

All that said, I have basically implemented the whole thing already, and
I am just working on polishing it up and adding automated unit testing.

I suspect the last 5% of the project may be the longest though, since I
need to go through it carefully and make sure it behaves the way the
protocol says it should behave (for example, client MUST initiate a hard
disconnect when server does X.)

Anyways, thanks again! I really appreciate your insights.

Sincerely,

Connor

