Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0032F403075
	for <lists+nbd@lfdr.de>; Tue,  7 Sep 2021 23:48:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AC726208BF; Tue,  7 Sep 2021 21:48:42 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  7 21:48:42 2021
Old-Return-Path: <josh@joshtriplett.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 028AF208B2
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Sep 2021 21:48:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.781 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mER2emS9Sinf for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Sep 2021 21:48:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 667B12088C
	for <nbd@other.debian.org>; Tue,  7 Sep 2021 21:48:30 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id AE8D85C0161;
	Tue,  7 Sep 2021 17:48:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 07 Sep 2021 17:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	joshtriplett.org; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=fm1; bh=y6B
	/8hX3Q0P0OYxG+J0FivZXCqzWz76ELyoXlQDQCt8=; b=fN2Sk7XB8RQvbU+l96U
	0M0J+7tolIDIeuhc0iBpZdOtvucAfWJ+Va+R3u7mqCYREpn3oeFI//seB0/YoTdN
	gxT2cF88mYvkiNMZ1LZfM03e3fXS6vk1rI+lsa/R/R8CCcrlNliAzHExGUKk4Nlc
	Wq/y+JLJcLxERISCmDclQhUvrCs8GEDcfRrrSJ0ESXRIP7UWdctq+QRr5w+ZM6HV
	meGhythQCDPzSuYyZaQEM4c3OaWyt2S1X7zwp/5ms1V7hg1HWh3O3chAC+m3iHqs
	GRM/wVqsUJtjoEvjNsqxrFDSVGl8YF9pWjozxNuzJ1T6mHwCjd2PNLNO9W66Urn0
	eyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=y6B/8h
	X3Q0P0OYxG+J0FivZXCqzWz76ELyoXlQDQCt8=; b=YZ46aVfs+l+56z5FO38hkG
	sfb3Kq4GY6moaL0EtbkUr/g7rVG+C14DpHE0U4GUEoA+jq06XOfljIQ/d42Ekr8o
	9+7llrrkgQ/F2CJUtVHLfjDl/yBpojr/4BOv4x/S+5S5z2SJdwL3NN5I3CjDQ+Sx
	SB/jat2gXO4H01D94fNlElTdSA6Urw0jRUhN8suX8++WW5Mas7KCO2pM5FVoMrCR
	3MbCbaTz/2FgcCkH6h93+Dqd/63K0IXCY0QMmPdJiAVvKfI+HHHHQHoOcfTv2bRT
	2VBbjazK5qQKXawJl2UwAy8v+w2thiiAosBmeyRZaVAQcouFrwd6YrIxq6ECe42Q
	==
X-ME-Sender: <xms:K943YffklOh1oB4jvtHPgCEg_L5J6LTQp-HGBRZN_28yuG_0E9dpEQ>
    <xme:K943YVODxVqT0Svq7xZ25A4u2m94i_yD1XVK2mD1iFHlzcSt7aaPMRGfzcPcfBPGB
    eLZYRKysZvV75jHInU>
X-ME-Received: <xmr:K943YYjU-RuOqANBFTAzUlwedOtJ-uEqGz5r7yqdYaaMDn3yMGzwyjBelLc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefiecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheplfhoshhhucfvrhhi
    phhlvghtthcuoehjohhshhesjhhoshhhthhrihhplhgvthhtrdhorhhgqeenucggtffrrg
    htthgvrhhnpeegtdfgfeeghfevgeelgfefieegudeuheekkedtueeutefgheffveegueei
    teehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hjohhshhesjhhoshhhthhrihhplhgvthhtrdhorhhg
X-ME-Proxy: <xmx:K943YQ8alYB2FHZ5MmzOklAj8vzkgOKAszTjJkOBWHXPjSHD8JvL_A>
    <xmx:K943YbtW_fh2n-hREfrFsJ5x3shKrSTs9mw5DKNjEqKAB0lSkCTF8w>
    <xmx:K943YfGLFD-FmMONtotUOx41oPvO-d9xDdp6Xe1o1xo-tVI1sNMGPA>
    <xmx:K943YZ36KR4URTDDf36TrhNbm16n8ppwjMnz11dbygvSGBOHNuI5kw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Sep 2021 17:48:26 -0400 (EDT)
Date: Tue, 7 Sep 2021 14:48:26 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org
Subject: Re: Linux kernel NBD driver support for structured replies?
Message-ID: <YTfeKmYoXbnYIZF5@localhost>
References: <YTfXZDs4YHrxHYJe@localhost>
 <20210907213513.aq5qxd3d6v3ss676@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907213513.aq5qxd3d6v3ss676@redhat.com>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <HvAgYelBslE.A.RxF.649NhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1409
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YTfeKmYoXbnYIZF5@localhost
Resent-Date: Tue,  7 Sep 2021 21:48:42 +0000 (UTC)

On Tue, Sep 07, 2021 at 04:35:13PM -0500, Eric Blake wrote:
> On Tue, Sep 07, 2021 at 02:19:32PM -0700, Josh Triplett wrote:
> > I'm currently using the NBD client driver in the Linux kernel. At some
> > point, I'd be interested in adding support for structured replies,
> > specifically so that an NBD server can efficiently handle ranges of
> > zeroes (e.g.  "for the 4k block you asked for, here are 200 bytes of
> > data, and the rest if zero").
> 
> I don't know if you'll get the granularity of 200 bytes given the
> nature of file system blocking, but it's definitely worth adding the
> support so that "for the 64k block you asked for, here are 4k of data
> and the rest is zero".

I'm hoping to make the client capable of handling byte granularity. As
far as I can tell, the spec allows this; NBD_REPLY_TYPE_OFFSET_DATA and
NBD_REPLY_TYPE_OFFSET_HOLE both take a length in bytes (not blocks). It
does say "each chunk MUST describe at least one byte, although to
minimize overhead, the server SHOULD use chunks with lengths and offsets
as an integer multiple of 512 bytes, where possible", but the initial
implementation I had in mind wouldn't actually benefit from that, and
since it's a "SHOULD" the client still needs to handle the
byte-granularity case.

I had planned to just accumulate the data in a buffer, and handle
NBD_REPLY_TYPE_OFFSET_HOLE with memset; that's still more efficient than
sending zeroes over the wire, and it'd always be possible to add more
efficiency later.

> It will also pay dividends if you also add support for querying the
> "base:allocation" meta context information, so that the kernel can
> then acurately implement lseek(SEEK_HOLE) and similar on an NBD
> device, since that also requires structured reply support.

For a first pass, I only planned to only support structured replies, not
contexts or metadata.

> > Does that seem reasonable to add to the kernel driver? I wanted to check
> > before considering development of a patch.
> 
> I'm not aware of anyone else doing it yet (I haven't yet been brave
> enough to dive into implementing this in the kernel, although I have
> implemented it in user space in both qemu and libnbd).  I'm certainly
> happy to help with integration testing, or give you tips on how to
> test it.

Thank you!

I'll check back when I start to implement it. Might be a while; I just
wanted to start the conversation early.

- Josh Triplett

