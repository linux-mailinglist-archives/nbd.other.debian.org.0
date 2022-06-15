Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC9454C79F
	for <lists+nbd@lfdr.de>; Wed, 15 Jun 2022 13:40:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E55BC2055C; Wed, 15 Jun 2022 11:40:25 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun 15 11:40:25 2022
Old-Return-Path: <Nikolaus@rath.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,RCVD_IN_DNSWL_LOW,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A800A20552
	for <lists-other-nbd@bendel.debian.org>; Wed, 15 Jun 2022 11:40:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.81 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_LOW=-0.7, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tOVa8vuvPREd for <lists-other-nbd@bendel.debian.org>;
	Wed, 15 Jun 2022 11:40:12 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .rath. - helo: .wout3-smtp.messagingengine. - helo-domain: .messagingengine.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id DE5072054F
	for <nbd@other.debian.org>; Wed, 15 Jun 2022 11:40:11 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 155053200990;
	Wed, 15 Jun 2022 07:40:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 15 Jun 2022 07:40:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rath.org; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1655293206; x=
	1655379606; bh=ITiLykgDiAyRNZKU40TTTrEovdscI5Tu/tBYZx9IX70=; b=W
	BlvmMSnCyjA7dDVnDl03qToqnqI/UzOYBVsfZbgDPMz2+W5cURBZa1QIFhS6uUDY
	AcaTVNNgtOCXKcPFW2YRTVeiRQn/03JKVCigjQVwWosbsGSGk8Z4RTo55M/4FkO1
	2XS9OV3q2uwzBnyKNr2gE8MNNiASkEAlTXnKiclgDZre1Es1ncJdoSe9dTxUd5ov
	zJKRZZtQ0Ot2VsObRYGNcsz6++9Iad0VP0jdgfxD4/JveJxSnDS54sfwILNoQuQf
	s+LPd9b3l38dSYpwp0jaYqTKCK+bb8iRz1PjidlOA+JaqIZAfQC8+EhedIvdNW/D
	3TVNl+GNG2YakuYQ2dacg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655293206; x=
	1655379606; bh=ITiLykgDiAyRNZKU40TTTrEovdscI5Tu/tBYZx9IX70=; b=k
	z8ttRLeAKrHt2+sEkXV6UKYoe8PWV61qKMM4748LtyGXLreZRplJyC3WYgpQTf8b
	3efrUnit25jSIknRs1ETEGR2Gk6IVzIn+PVvwK0Jh1zRLio+DybnmX/4/ZElJJrn
	jCenYgilyrd7LyzDAX3hLTwV4v/oWpoTgxEuHeXEqSDJCweacIj+LtwvEda/8/aR
	DdriuaBb/JrK/9S996YcYUvCT9r45Q6MRKLnLSZbpmLPs4M4dhsi6amjDQqcT2iU
	lyTi0scIF3ZiD9oaHvChBEFdlL2KbmAIME1wGK7ZB+ac6WiV9ph58kOu+gjgYkWW
	I8ABY6XlJk1E5P1LAmh/A==
X-ME-Sender: <xms:FsWpYpTnj-3JZjnTePFD-9kXxbbsVz4rAybhrdCt3Q4TiVDkRAeUjQ>
    <xme:FsWpYiyuuoyLg7U6w4d9vf6E0YQCuEamouJ8Owd7OcbnM2UiookHMOOJrf8Vu45ty
    2auOUMwVWXQxjL_>
X-ME-Received: <xmr:FsWpYu0I6FMf_0KBcW6ljT4-Q8Fs4-2rmr3u_Le73dyoyDOYgFYb-VXVWtAnr1iTkD3hlmKIVRM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvuddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufhffjgfkfgggtgfgsehtqhdttddtreejnecuhfhrohhmpefpihhk
    ohhlrghushcutfgrthhhuceopfhikhholhgruhhssehrrghthhdrohhrgheqnecuggftrf
    grthhtvghrnhepkefhgfdukeejgedvuefgjeevudeutdethefgjedugeffteffffevleff
    udevgfefnecuffhomhgrihhnpehkohdrsggvshhtnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheppfhikhholhgruhhssehrrghthhdrohhrgh
X-ME-Proxy: <xmx:FsWpYhAnMDcBbnEKtpfdKA58-NKvC-emu-yFPLvjqW2oBdQudnuRFg>
    <xmx:FsWpYijGnOHr2wdwEaGUTSiZ95gidvzhmyo5tZzZQ_GshRz1wJT4vQ>
    <xmx:FsWpYlrrjsdy1DLB4XfZhdDppkvtx_QuqYB8AZUk0TaRwJldI4jL6w>
    <xmx:FsWpYkbrC7UJHKFGVtKHqfjYZwigze5o0BfQFSW-HScuQ0ZFj1JXPg>
Feedback-ID: i53a843ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jun 2022 07:40:06 -0400 (EDT)
Received: from vostro.rath.org (vostro [192.168.12.4])
	by ebox.rath.org (Postfix) with ESMTPS id 43268B3D;
	Wed, 15 Jun 2022 11:40:04 +0000 (UTC)
Received: by vostro.rath.org (Postfix, from userid 1000)
	id 6FB6BC85FA; Wed, 15 Jun 2022 12:40:03 +0100 (BST)
From: Nikolaus Rath <Nikolaus@rath.org>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Eric Blake <eblake@redhat.com>,  nbd@other.debian.org,
  libguestfs@redhat.com
Subject: Re: [Libguestfs] Kernel driver I/O block size hinting
References: <20220614143819.GX8021@redhat.com>
	<87bkuv59h4.fsf@vostro.rath.org> <20220615100931.GS1127@redhat.com>
	<20220615103503.GB5720@redhat.com>
Mail-Copies-To: never
Mail-Followup-To: "Richard W.M. Jones" <rjones@redhat.com>, Eric Blake
	<eblake@redhat.com>, nbd@other.debian.org, libguestfs@redhat.com
Date: Wed, 15 Jun 2022 12:40:03 +0100
In-Reply-To: <20220615103503.GB5720@redhat.com> (Richard W. M. Jones's message
	of "Wed, 15 Jun 2022 11:35:03 +0100")
Message-ID: <878rpy5f58.fsf@vostro.rath.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <NlqMWsWCaDB.A.RiE.pUcqiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2141
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/878rpy5f58.fsf@vostro.rath.org
Resent-Date: Wed, 15 Jun 2022 11:40:25 +0000 (UTC)

On Jun 15 2022, "Richard W.M. Jones" <rjones@redhat.com> wrote:
> On Wed, Jun 15, 2022 at 11:09:31AM +0100, Richard W.M. Jones wrote:
>> This kernel setting limits the maximum request size on the queue.
>>=20
>> In my testing reading and writing files with the default [above] the
>> kernel never got anywhere near sending multi-megabyte requests.  In
>> fact the largest request it sent was 128K, even when I did stuff like:
>>=20
>> # dd if=3D/dev/zero of=3D/tmp/mnt/zero bs=3D100M count=3D10
>>=20
>> 128K happens to be 2 x blk_queue_io_opt, but I need to do more testing
>> to see if that relationship always holds.
>
> The answer is apparently no.  With minimum_io_size =3D=3D 64K and
> optimal_io_size =3D=3D 256K, the server still only sees at most 128K
> requests.

I have seen larger requests. Example (from the stats fiter):

WRITE request sizes:
   131072 bytes: 66.1% of requests (8521)
          9 bit aligned: 100.0% (8521)
         10 bit aligned:  62.5% (5327)
         11 bit aligned:  28.6% (2438)
         12 bit aligned:  10.6% (907)
         13 bit aligned:   6.0% (508)
         14 bit aligned:   5.0% (426)
         15+ bit-aligned:  4.9% (415)
   262144 bytes:  9.2% of requests (1185)
          9 bit aligned: 100.0% (1185)
         10 bit aligned:  67.2% (796)
         11 bit aligned:  48.8% (578)
         12 bit aligned:  13.4% (159)
         14 bit aligned:  11.9% (141)
         15 bit aligned:  11.8% (140)
         16 bit aligned:  11.7% (139)
         17 bit aligned:  11.3% (134)
         18 bit aligned:   5.8% (69)
         19+ bit-aligned:  2.7% (32)
   393216 bytes:  6.5% of requests (841)
          9 bit aligned: 100.0% (841)
         10 bit aligned:  64.2% (540)
         11 bit aligned:  52.2% (439)
         12 bit aligned:  17.5% (147)
         13 bit aligned:  15.2% (128)
         14 bit aligned:  14.6% (123)
         15 bit aligned:  14.0% (118)
         16 bit aligned:  13.8% (116)
         17 bit aligned:  12.5% (105)
         18 bit aligned:   6.4% (54)
         19+ bit-aligned:  3.3% (28)
   524288 bytes:  4.4% of requests (571)
          9 bit aligned: 100.0% (571)
         10 bit aligned:  55.2% (315)
         11 bit aligned:  49.0% (280)
         12 bit aligned:  34.7% (198)
         13 bit aligned:  28.5% (163)
         14 bit aligned:  26.8% (153)
         16 bit aligned:  25.4% (145)
         17 bit aligned:  22.4% (128)
         18 bit aligned:  11.7% (67)
         19 bit aligned:   6.3% (36)
         20+ bit-aligned:  3.3% (19)
   655360 bytes:  3.8% of requests (493)
          9 bit aligned: 100.0% (493)
         10 bit aligned:  57.0% (281)
         11 bit aligned:  51.7% (255)
         12 bit aligned:  46.0% (227)
         13 bit aligned:  41.0% (202)
         14 bit aligned:  40.4% (199)
         16 bit aligned:  36.5% (180)
         17 bit aligned:  32.5% (160)
         18 bit aligned:  16.6% (82)
         19 bit aligned:   9.3% (46)
         20 bit aligned:   5.1% (25)
         21+ bit-aligned:  1.8% (9)
   786432 bytes:  2.1% of requests (270)
          9 bit aligned: 100.0% (270)
         10 bit aligned:  50.4% (136)
         11 bit aligned:  47.4% (128)
         12 bit aligned:  42.6% (115)
         13 bit aligned:  34.1% (92)
         14 bit aligned:  31.9% (86)
         16 bit aligned:  31.1% (84)
         17 bit aligned:  28.1% (76)
         18 bit aligned:  14.8% (40)
         19 bit aligned:   7.4% (20)
         20+ bit-aligned:  3.3% (9)
     1024 bytes:  1.8% of requests (238)
         10 bit aligned: 100.0% (238)
         11 bit aligned:  52.5% (125)
         12 bit aligned:  25.2% (60)
         13 bit aligned:  11.8% (28)
         14 bit aligned:   5.0% (12)
         17+ bit-aligned:  1.7% (4)
   917504 bytes:  0.9% of requests (113)
          9 bit aligned: 100.0% (113)
         10 bit aligned:  61.9% (70)
         11 bit aligned:  52.2% (59)
         12 bit aligned:  50.4% (57)
         14 bit aligned:  38.9% (44)
         16 bit aligned:  38.1% (43)
         17 bit aligned:  34.5% (39)
         18 bit aligned:  18.6% (21)
         19 bit aligned:   8.8% (10)
         20+ bit-aligned:  3.5% (4)
  1048576 bytes:  0.2% of requests (23)
          9 bit aligned: 100.0% (23)
         11 bit aligned:  56.5% (13)
         16 bit aligned:  52.2% (12)
         17 bit aligned:  43.5% (10)
         19 bit aligned:   8.7% (2)
         22 bit aligned:   4.3% (1)
    other sizes:  4.9% of requests (631)


However, these are still far less than what I would have liked to see (I
was writing a number of huge files through ZFS, and had hoped to see
lots of 32 MB requests).

> Although I still think we need to make these changes to nbd.ko, I
> don't think this is going to solve the original problem of trying to
> aggregate requests into the very large block sizes favoured by S3.
> (nbdkit blocksize filter + a layer of caching seems like the way to go
> for that)

Yeah.. that'd be quite a shame though. We'd be pretty much duplicating
the page cache, solely for the purpose of processing it in different
chunks than those produced by NBD.ko.


Best,
-Nikolaus

--=20
GPG Fingerprint: ED31 791B 2C5C 1613 AF38 8B8A D113 FCAC 3C4E 599F

             =C2=BBTime flies like an arrow, fruit flies like a Banana.=C2=
=AB

