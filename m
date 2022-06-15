Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E1F54C7A3
	for <lists+nbd@lfdr.de>; Wed, 15 Jun 2022 13:43:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 610F420557; Wed, 15 Jun 2022 11:43:27 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun 15 11:43:27 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 6FF182054C
	for <lists-other-nbd@bendel.debian.org>; Wed, 15 Jun 2022 11:43:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.81 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_LOW=-0.7, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tN3BkJdshOZH for <lists-other-nbd@bendel.debian.org>;
	Wed, 15 Jun 2022 11:43:14 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B6D7D204F9
	for <nbd@other.debian.org>; Wed, 15 Jun 2022 11:43:14 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id DFD7F3200948;
	Wed, 15 Jun 2022 07:43:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 15 Jun 2022 07:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rath.org; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1655293390; x=
	1655379790; bh=A/wFiI4GbSAC89rVp6/FtdzoSQVug+o93Kk+tI3j/Uo=; b=R
	zsDpIHCitdY3FBbE7DRfjiLJ3HJtydeUsD94Kmd32H3wCHzUXPaxNJyApRHK+P9S
	nEekkRzQVMad7V9jJpCcWdu8La9RziZMgTo8f/2ttVWEIN3yL8aElvQg+9+Pvl5N
	jz3WjTg/Nrdz4TOfklctzQsTfyo75CkCcmfQAuqpUV2aRp0c/GQzjJu5tod6dym2
	KcXLSANY/1vU1SjxhAayQ1w0/SHVHYwg6yF6C9fRJEoLR56l/hB0G2To8vO2BhQL
	8SDkPO5pvqVXAq3opgXxIrMkp7k1P4DGp1HEq975NOK5jhmmIapF6Id5H+KamGO7
	ojrpf7myyaw3lUJCi5DjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655293390; x=
	1655379790; bh=A/wFiI4GbSAC89rVp6/FtdzoSQVug+o93Kk+tI3j/Uo=; b=Z
	fN1ti1ZTZkZpIOUgk81d2eoNIuyepNb/O2cKkkpKam9V7j58YuJI0C4bjO7dDhmb
	7HhpdKszrzo/8DfRJxaorc8eDmvhifBNrWDJNAih68DrC5AGXJ1k5fJlmc45yhPE
	PX5sf0BlQ+qO+6cv3u+bUQxxSZdhz0tx2qEr9kwiW6qzzu0siPYToIMHV/FAs197
	ZD65jaPQ9quj/Vkab4sIzcEp4a4amz2v4aYERoUJenFMYLpAUryVLlHHy34MhzkO
	FEyNVHQSb5xD/frfW8CgScgtxPo+VU48eYH2ueqbiPA7FkPno66KIaVQwrcJudAM
	lgC7JscNXzuioNK6QeGyA==
X-ME-Sender: <xms:zsWpYq8webbBDwZiKTvBrljHD9CeMWVVNdOpJiwPYhPE-BCBc5WLjA>
    <xme:zsWpYqsQoX6hNacyKrpUtuEXgWyL3DQBA8aBO6Bzl44e4KN6tEmN-95pP_4czWHUS
    jrnpRJxZGJUX_bm>
X-ME-Received: <xmr:zsWpYgATkj6tUm4Ui2L1mMY2G-f1fb_5uSZQYzTso4A-ETXL7EVBB8rxvKu6lwBF0guBRyLiNHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvuddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufhffjgfkfgggtgfgsehtqhdttddtreejnecuhfhrohhmpefpihhk
    ohhlrghushcutfgrthhhuceopfhikhholhgruhhssehrrghthhdrohhrgheqnecuggftrf
    grthhtvghrnhepleffjefhgfffiedufeekvdeflefhheejjedugeejuefgleehvdejtdeg
    kedthfetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eppfhikhholhgruhhssehrrghthhdrohhrgh
X-ME-Proxy: <xmx:zsWpYieDJ6pOwmNcbgBDiLKF0gf_0GMVFkec0nYLm4DEsGCFcbPXig>
    <xmx:zsWpYvOl3-js15_LOIHBLlGuvGu-0WSlrshsRSRfbz_ZrekDaqsvBA>
    <xmx:zsWpYsmWPE3_3LHjoLcQ2Rd7Upqf-6Pu7xr-Kwt7HRtAZKdRW9r38Q>
    <xmx:zsWpYq07P953qgNH4-uAdvyNDxmLP8Cw7URw5CAivdYSpYFxOZPYeg>
Feedback-ID: i53a843ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jun 2022 07:43:10 -0400 (EDT)
Received: from vostro.rath.org (vostro [192.168.12.4])
	by ebox.rath.org (Postfix) with ESMTPS id C7B6AB3D;
	Wed, 15 Jun 2022 11:43:08 +0000 (UTC)
Received: by vostro.rath.org (Postfix, from userid 1000)
	id 525F0C86F5; Wed, 15 Jun 2022 12:43:08 +0100 (BST)
From: Nikolaus Rath <Nikolaus@rath.org>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Eric Blake <eblake@redhat.com>,  nbd@other.debian.org,
  libguestfs@redhat.com
Subject: Re: [Libguestfs] Kernel driver I/O block size hinting
References: <20220614143819.GX8021@redhat.com>
	<87bkuv59h4.fsf@vostro.rath.org> <20220615100931.GS1127@redhat.com>
Mail-Copies-To: never
Mail-Followup-To: "Richard W.M. Jones" <rjones@redhat.com>, Eric Blake
	<eblake@redhat.com>, nbd@other.debian.org, libguestfs@redhat.com
Date: Wed, 15 Jun 2022 12:43:08 +0100
In-Reply-To: <20220615100931.GS1127@redhat.com> (Richard W. M. Jones's message
	of "Wed, 15 Jun 2022 11:09:31 +0100")
Message-ID: <875yl25f03.fsf@vostro.rath.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LqVTm2NSj0N.A.hwE.fXcqiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2142
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/875yl25f03.fsf@vostro.rath.org
Resent-Date: Wed, 15 Jun 2022 11:43:27 +0000 (UTC)

On Jun 15 2022, "Richard W.M. Jones" <rjones@redhat.com> wrote:
>> > I think we could set this to MIN (32M, NBD maximum block size constrai=
nt),
>> > converting the result to sectors.
>>=20
>> I don't think that's right. Rather, it should be NBD's preferred block
>> size.
>>
>> Setting this to the preferred block size means that NBD requests will be
>> this large whenever there are enough sequential dirty pages, and that no
>> requests will ever be larger than this. I think this is exactly what the
>> NBD server would like to have.
>
> This kernel setting limits the maximum request size on the queue.

Right. But why not limit it to the *preferred* blocksize of the NBD
server? The kernel obviously does not care, and the NBD server obviously
prefers this blocksize over the maximum block size.

> In my testing reading and writing files with the default [above] the
> kernel never got anywhere near sending multi-megabyte requests.

Well, yes, but that shouldn't affect which value we should use, I think.

>> Unrelated to the proposed changes (all of which I think are technically
>> correct), I am wondering if this will have much practical benefits. As
>> far as I can tell, the kernel currently aligns NBD requests to the
>> logical/physical block size rather than the size of the NBD request. Are
>> there NBD servers that would benefit from the kernel honoring the
>> preferred blocksize if the data is not also aligned to this blocksize?=20
>
> I'm not sure I parsed this.  Can you give an example?

No - I am asking for examples :-). My question is: in which scenario is
it helpful for the NBD server to receive non-aligned requests of its
preferred blocksize? Isn't that just as bad as receiving requests with a
non-preferred blocksize?


Best,
-Nikolaus

--=20
GPG Fingerprint: ED31 791B 2C5C 1613 AF38 8B8A D113 FCAC 3C4E 599F

             =C2=BBTime flies like an arrow, fruit flies like a Banana.=C2=
=AB

