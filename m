Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A46F54BA88
	for <lists+nbd@lfdr.de>; Tue, 14 Jun 2022 21:30:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E0574203D6; Tue, 14 Jun 2022 19:30:37 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 14 19:30:37 2022
Old-Return-Path: <Nikolaus@rath.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CF2E62045D
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Jun 2022 19:30:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.788 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id EaWJ42_k_3Ug for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Jun 2022 19:30:22 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 50B7D203D6
	for <nbd@other.debian.org>; Tue, 14 Jun 2022 19:30:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id C683B5C0127;
	Tue, 14 Jun 2022 15:30:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 14 Jun 2022 15:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rath.org; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1655235018; x=
	1655321418; bh=Yr+ur6hOXZwKlFFiQCiyicnDp+AC17/CGa+qHhtqu4g=; b=l
	E7d6lMA8Aj5sWoQbswLvjW1t1XzBEQMLBYcUt0VIpfHu/wACPOYUg+gf04ss06i4
	Te++9Edah2ACdI4dNHUtOYMe3UFUOp5aCcAZajtZYs82v4oXNCfFwcxIqlgTXjkB
	btRTILz9P5YItO4sDJa3MbKmmPs/M7ZuFkp1jXy5GC7aCs+MGcWzdMqJ3RfgNgM2
	1S5ZmCDEBJSR9+lse3k37tqyfHHK4UZC80z/hur67hgbMsCyKMLkwYI5xoWQH0oI
	l90jeIN4CEINLTO6E9wge0V8pyD0sdiNUxuvA4UqPJZoRK+vxNMbb2MPXN0hx9Qg
	iIpf3FVQfJa0FChGgSeEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655235018; x=
	1655321418; bh=Yr+ur6hOXZwKlFFiQCiyicnDp+AC17/CGa+qHhtqu4g=; b=X
	M0f/ecWLttDWUt0g8yeWNsLKifuB01HjLApHp+lK5BRjV3tBvI9E0vMsM5Dexmyr
	lGgHM/yRKArzTlDpTJjVkPAd25X0aq353FCS0LMVIsVf8f7emVrZG0O3rwJ0KVA8
	53E7dU3K+I7utZpsya6cL3Rbs+A/HQ5GCD+KF4lOAlsqbXZUSZjVF/KlyYQL3IDU
	lsByuVaeGFq2fMORH/20x4IGPc21NFN5JucF1OiVDfwWd+Dh1a8wmR0f4jMlDR69
	gntRtTOsmFoq9HAUo6HdkoNoabZRkq/47tXOG4SxpHPKsB96Y7fLjKgMyxScuSr2
	O1yyt0AHRuuSHHtmbYGhw==
X-ME-Sender: <xms:yuGoYiRHH0uAfH15jCaGwoSJQsCkBXppRXAOYMd3X4dW6TXNE-wkLw>
    <xme:yuGoYny-YSvn0ocDYmeDppSdAQxPZsRftaAJI7yNsnlMNY2DnLbhZpBsCB_RGfJlw
    4p_-AnrGYhxqSXh>
X-ME-Received: <xmr:yuGoYv3acWPH1HW59-W7jy0nKSsFo_kbf9mcZYTAhb8hERG3ATwHElH8UyegeXKCQE49tcB35mM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduledgudefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufhfffgjkfgfgggtgfesthhqtddttderjeenucfhrhhomheppfhi
    khholhgruhhsucftrghthhcuoefpihhkohhlrghushesrhgrthhhrdhorhhgqeenucggtf
    frrghtthgvrhhnpeeufeekffetjeethfetgfelffeugefhieeilefguddvffdtueehueeh
    vddvvefgtdenucffohhmrghinheprhgvughhrghtrdgtohhmpdhgihhthhhusgdrtghomh
    dpphhrohhtohdrmhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomheppfhikhholhgruhhssehrrghthhdrohhrgh
X-ME-Proxy: <xmx:yuGoYuD3WC7Wgp4nsFlsgE5icgwpdAtK0vbYqLhFCujCB07ooE6EhQ>
    <xmx:yuGoYriOWKkMxXxUlRbHagQK0rKABa2aDs763nHqTo-xW1Wq0SzF0Q>
    <xmx:yuGoYqqwdE1g22X1FAja-CzHB9oA6JELg4XYEC4FhtCMUpGuHCrLLg>
    <xmx:yuGoYhbjBFtARnJULoOw8oHS1xZVrBebSFGiQcVJ0doDTTlnuxzN1w>
Feedback-ID: i53a843ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jun 2022 15:30:18 -0400 (EDT)
Received: from vostro.rath.org (vostro [192.168.12.4])
	by ebox.rath.org (Postfix) with ESMTPS id 69FEC4DA;
	Tue, 14 Jun 2022 19:30:16 +0000 (UTC)
Received: by vostro.rath.org (Postfix, from userid 1000)
	id D6346C8298; Tue, 14 Jun 2022 20:30:15 +0100 (BST)
From: Nikolaus Rath <Nikolaus@rath.org>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Eric Blake <eblake@redhat.com>,  nbd@other.debian.org,
  libguestfs@redhat.com
Subject: Re: Kernel driver I/O block size hinting
References: <20220614143819.GX8021@redhat.com>
Mail-Copies-To: never
Mail-Followup-To: "Richard W.M. Jones" <rjones@redhat.com>, Eric Blake
	<eblake@redhat.com>, nbd@other.debian.org, libguestfs@redhat.com
Date: Tue, 14 Jun 2022 20:30:15 +0100
In-Reply-To: <20220614143819.GX8021@redhat.com> (Richard W. M. Jones's message
	of "Tue, 14 Jun 2022 15:38:19 +0100")
Message-ID: <87bkuv59h4.fsf@vostro.rath.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <R1JVZS6RxDF.A.kZB.dHOqiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2138
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/87bkuv59h4.fsf@vostro.rath.org
Resent-Date: Tue, 14 Jun 2022 19:30:37 +0000 (UTC)

On Jun 14 2022, "Richard W.M. Jones" <rjones@redhat.com> wrote:
> This is a follow-up to this thread:
>
>   https://listman.redhat.com/archives/libguestfs/2022-June/thread.html#29=
210
>
> about getting the kernel client (nbd.ko) to obey block size
> constraints sent by the NBD server:
>
>   https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md#bloc=
k-size-constraints
>
> I was sent this very interesting design document about the original
> intent behind the kernel's I/O limits:
>
>   https://people.redhat.com/msnitzer/docs/io-limits.txt
>
> There are four or five kernel block layer settings we could usefully
> adjust, and there are three NBD block size constraints, and in my
> opinion there's not a very clear mapping between them.  But I'll have
> a go at what I think we should do.
>
> 	- - -
>
> (1) Kernel physical_block_size & logical_block_size: The example given
> is of a hard disk with 4K physical sectors (AF) which can nevertheless
> emulate 512-byte sectors.  In this case you'd set physical_block_size
> =3D 4K, logical_block_size =3D 512b.
>
> Data structures (partition tables, etc) should be aligned to
> physical_block_size to avoid unnecessary RMW cycles.  But the
> fundamental until of I/O is logical_block_size.
>
> Current behaviour of nbd.ko is that logical_block_size =3D=3D
> physical_block_size =3D=3D the nbd-client "-b" option (default: 512 bytes,
> contradicting the documentation).
>
> I think we should set logical_block_size =3D=3D physical_block_size =3D=3D
> MAX (512, NBD minimum block size constraint).

Why the lower bound of 512?

> What should happen to the nbd-client -b option?

Perhaps it should become the lower-bound (instead of the hardcoded 512)?
That's assuming there is a reason for having a client-specified lower
bound.

> (2) Kernel minimum_io_size: The documentation says this is the
> "preferred minimum unit for random I/O".
>
> Current behaviour of nbd.ko is this is not set.
>
> I think the NBD's preferred block size should map to minimum_io_size.
>
>
> (3) Kernel optimal_io_size: The documentation says this is the
> "[preferred] streaming I/O [size]".
>
> Current behaviour of nbd.ko is this is not set.
>
> NBD doesn't really have the concept of streaming vs random I/O, so we
> could either ignore this or set it to the same value as
> minimum_io_size.
>
> I have a kernel patch allowing nbd-client to set both minimum_io_size
> and optimal_io_size from userspace.
>
>
> (4) Kernel blk_queue_max_hw_sectors: This is documented as: "set max
> sectors for a request ... Enables a low level driver to set a hard
> upper limit, max_hw_sectors, on the size of requests."
>
> Current behaviour of nbd.ko is that we set this to 65536 (sectors?
> blocks?), which for 512b sectors is 32M.

FWIW, on my 5.16 kernel, the default is 65 kB (according to
/sys/block/nbdX/queue/max_sectors_kb x 512b).

> I think we could set this to MIN (32M, NBD maximum block size constraint),
> converting the result to sectors.

I don't think that's right. Rather, it should be NBD's preferred block
size.

Setting this to the preferred block size means that NBD requests will be
this large whenever there are enough sequential dirty pages, and that no
requests will ever be larger than this. I think this is exactly what the
NBD server would like to have.

Settings this to the maximum block size would mean that NBD requests
will exceed the preferred size whenever there are enough sequential
dirty pages (while still obeying the maximum). This seems strictly
worse.


Unrelated to the proposed changes (all of which I think are technically
correct), I am wondering if this will have much practical benefits. As
far as I can tell, the kernel currently aligns NBD requests to the
logical/physical block size rather than the size of the NBD request. Are
there NBD servers that would benefit from the kernel honoring the
preferred blocksize if the data is not also aligned to this blocksize?=20


Best,
-Nikolaus

--=20
GPG Fingerprint: ED31 791B 2C5C 1613 AF38 8B8A D113 FCAC 3C4E 599F

             =C2=BBTime flies like an arrow, fruit flies like a Banana.=C2=
=AB

