Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5DD5B6234
	for <lists+nbd@lfdr.de>; Mon, 12 Sep 2022 22:31:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2975E20769; Mon, 12 Sep 2022 20:31:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 12 20:31:33 2022
Old-Return-Path: <nikolaus@rath.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,HTML_MESSAGE,HTML_NBSP,
	LDOSUBSCRIBER,LDO_WHITELIST,ONEWORD,RCVD_IN_DNSWL_LOW,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2B2BD20766
	for <lists-other-nbd@bendel.debian.org>; Mon, 12 Sep 2022 20:31:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.81 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, HTML_MESSAGE=2,
	HTML_NBSP=2, LDO_WHITELIST=-5, ONEWORD=2, RCVD_IN_DNSWL_LOW=-0.7,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6FrGSvRG5Bm3 for <lists-other-nbd@bendel.debian.org>;
	Mon, 12 Sep 2022 20:31:12 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .rath. - helo: .wout4-smtp.messagingengine. - helo-domain: .messagingengine.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 69B9C2075F
	for <nbd@other.debian.org>; Mon, 12 Sep 2022 20:31:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 3B03C3200987;
	Mon, 12 Sep 2022 16:31:07 -0400 (EDT)
Received: from imap45 ([10.202.2.95])
  by compute4.internal (MEProxy); Mon, 12 Sep 2022 16:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rath.org; h=cc
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1663014666; x=1663101066; bh=HjDAMv23chqTgPSHgMLKClELb0q6/nFPXe5
	TmJoRZ9A=; b=KBvA23Se20nZganSJsYhV6IyLlm6e7/5+ONb383HvhsnxO+Fewv
	sLAYXzLBDWlJ2rsGZEZ5V5qAYPu7LbN8lGB/PjfwTXURtufRacacHmqdzO/gDzj5
	MByVInFuZ1/br9sAS2xEcctdCnfdk2/tMMuwCjRb3nDK519P2M+8Xrmx50ohfB1i
	MoBEsfZZBOHTOLlfuaPc7Hf9B2dyYqzQb8rEEnTr9C4PusBQlo4IJc6udj7QKfDM
	mVjJxV3tKdTu3Ri+jsTkLYyjdHiOHu6Ne7wOfi7aajH9pMbpoKiGl68echRw/AZJ
	rQbRYhesHOddLmVydLNmxD+5mfvcE4gXaHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663014666; x=
	1663101066; bh=HjDAMv23chqTgPSHgMLKClELb0q6/nFPXe5TmJoRZ9A=; b=b
	/lSPQ68ni5N8I1N59RUv+3YX8sqHCvNrzGAYUd2jgCew2UIqkzdxEelQJj+IZsw6
	N5QkIypNm7MdGRHOtClhnK9aFRXwS+WqeTWeL5vK2qJ6NQnxgMQGuP6MmlLC4lCW
	+n4DlbMfrvzRB62jVO9AJBAD/1KNwPzmANs9q4i1NRe8iNx1p3k0g5yqiyJGD9n7
	sVk0/Uz3WxHjFA84iblvY7kAPco1j9OWXFGW5uiduGNLkB8Xs8Pb2J0Hch3lJpjD
	bp4c4fCmuCuwK4hrksuErGaYMnUP02T3SeOWT9SkbAUYrWiE/8l0/HPRuQmNMKrH
	tIChyhoW7wNU5Y3DhOxwg==
X-ME-Sender: <xms:CpcfY5UALFkTBNszTjrrBrvoQcd8WkxYlEW0T4qsmiKmUp-Pkt4I8g>
    <xme:CpcfY5k5lIeTivdJc5HOZmoO4pGNwIwqsX9jnm4YX5lbKnSXCrzybjyCJj0cUHU8m
    fKsdWoIW8LzA86H>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduvddgudehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesrgdtre
    erreerjeenucfhrhhomhepfdfpihhkohhlrghushcutfgrthhhfdcuoehnihhkohhlrghu
    shesrhgrthhhrdhorhhgqeenucggtffrrghtthgvrhhnpeevleeiteegudekvdduheeuvd
    ffgeekkeeviedugeffveegvddvvdejgfetffejudenucffohhmrghinheprhgrthhhrdho
    rhhgnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepnh
    hikhholhgruhhssehrrghthhdrohhrgh
X-ME-Proxy: <xmx:CpcfY1ZUSKTLsjpedpqMuiFdBQgrwSk13yUc3cYMQkIJAJUNcy981A>
    <xmx:CpcfY8WYvIasGyE_mT5oNpoDPpvlf8dEgET5mBER_x61gVpLu59wkA>
    <xmx:CpcfYznObbfda9cMnGpG5psJMr_oHp-1Doo0iYlTFupqUW9YaVbWbA>
    <xmx:CpcfYxjiB2rFEgstC2yk7-GzEaeS1PkONNjViQHd06OEhwoj8YHFgA>
Feedback-ID: i53a843ae:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 629ED2720078; Mon, 12 Sep 2022 16:31:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-929-g09f3e68182-fm-20220908.004-g09f3e681
Mime-Version: 1.0
Message-Id: <ee18c441-0734-412e-8533-4ace1973a715@www.fastmail.com>
Date: Mon, 12 Sep 2022 21:30:46 +0100
From: "Nikolaus Rath" <nikolaus@rath.org>
To: libguestfs@redhat.com, nbd@other.debian.org,
 zfs-discuss@list.zfsonlinux.org
Subject: ZFS-on-NBD
Content-Type: multipart/alternative;
 boundary=32a724d1220e492e8fb5e78377e1399d
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xWxtHyYyBbM.A._h.lc5HjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2219
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ee18c441-0734-412e-8533-4ace1973a715@www.fastmail.com
Resent-Date: Mon, 12 Sep 2022 20:31:33 +0000 (UTC)

--32a724d1220e492e8fb5e78377e1399d
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

In case people have been wondering about the background of the various q=
uestions that I asked on these lists in the last few months:=20

I've been experimenting with running ZFS-on-NBD as a cloud backup soluti=
on (and potential alternative to S3QL, which I am using for this purpose=
 at the moment).

In case someone is interested, here is the (rather long) write-up: https=
://www.rath.org/s3ql-vs-zfs-on-nbd.html

Best,
-Nikolaus

--
GPG Fingerprint: ED31 791B 2C5C 1613 AF38 8B8A D113 FCAC 3C4E 599F

             =C2=BBTime flies like an arrow, fruit flies like a Banana.=C2=AB


--32a724d1220e492e8fb5e78377e1399d
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}
p.MsoNormal,p.MsoNoSpacing{margin:0}</style></head><body><div>Hi all,<br=
></div><div><br></div><div>In case people have been wondering about the =
background of the various questions that I asked on these lists in the l=
ast few months: <br></div><div><br></div><div>I've been experimenting wi=
th running ZFS-on-NBD as a cloud backup solution (and potential alternat=
ive to S3QL, which I am using for this purpose at the moment).<br></div>=
<div><br></div><div>In case someone is interested, here is the (rather l=
ong) write-up: <a href=3D"https://www.rath.org/s3ql-vs-zfs-on-nbd.html">=
https://www.rath.org/s3ql-vs-zfs-on-nbd.html</a><br></div><div><br></div=
><div>Best,<br></div><div>-Nikolaus<br></div><div><br></div><div id=3D"s=
ig33580657"><div class=3D"signature">--<br></div><div class=3D"signature=
">GPG Fingerprint: ED31 791B 2C5C 1613 AF38 8B8A D113 FCAC 3C4E 599F<br>=
</div><div class=3D"signature"><br></div><div class=3D"signature">&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =C2=BB=
Time flies like an arrow, fruit flies like a Banana.=C2=AB<br></div><div=
 class=3D"signature"><br></div></div><div><br></div></body></html>
--32a724d1220e492e8fb5e78377e1399d--

