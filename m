Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A685EF378
	for <lists+nbd@lfdr.de>; Thu, 29 Sep 2022 12:30:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E76D32055F; Thu, 29 Sep 2022 10:30:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 29 10:30:58 2022
Old-Return-Path: <nikolaus@rath.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,HTML_MESSAGE,HTML_NBSP,
	LDOSUBSCRIBER,LDO_WHITELIST,RCVD_IN_DNSWL_LOW autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1C09A2052A
	for <lists-other-nbd@bendel.debian.org>; Thu, 29 Sep 2022 10:30:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.8 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, HTML_MESSAGE=2,
	HTML_NBSP=2, LDO_WHITELIST=-5, RCVD_IN_DNSWL_LOW=-0.7]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4h8SrbjwG6vE for <lists-other-nbd@bendel.debian.org>;
	Thu, 29 Sep 2022 10:30:39 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .rath. - helo: .out5-smtp.messagingengine. - helo-domain: .messagingengine.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id AB3D020508
	for <nbd@other.debian.org>; Thu, 29 Sep 2022 10:30:38 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id C001D5C0139;
	Thu, 29 Sep 2022 06:30:35 -0400 (EDT)
Received: from imap45 ([10.202.2.95])
  by compute4.internal (MEProxy); Thu, 29 Sep 2022 06:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rath.org; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1664447435; x=1664533835; bh=r2bUIwuDvq
	rUYSWfFMvlvryI2JQnLwWoQrFdBKFaaxw=; b=UWNa5wVrf6prFQW/4pAweQkroj
	trtLzmi4PB5brgaReH2YABFDm1E2g7jSes8QQIoafPwdwRa3cGmUYfNKvMANbk87
	POEJEp//LTQki2XtSoHWku4MlLZfBsve/6IXXnBA+71WcJFNQqEsiYQC+8vlF+Ui
	vhKMOkEbrsicblYeAds2oxceb3NYwvAKDoGud88yeDtacKo91oewHE05CzLBIF9P
	monReVbfILxke15PF985AEiDzsTHi6sDAC7S0y8A2sZz7ZEpGDtaTSN8dclvncqT
	Hbe+WiB54As+skxUES0APOw+RYrESwuXPGZsTCToZfTFHpmwI/uFjXjSDbTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664447435; x=1664533835; bh=r2bUIwuDvqrUYSWfFMvlvryI2JQn
	LwWoQrFdBKFaaxw=; b=vNN9XUR8eYBBeHYIhPfh2xsubuuUgqjP7MZwyheBwGev
	OfhmzFk22NZ1VEQ5tj6l1h/sclI8fmFiYTC+FMv26wANq0M2fDxXzjScdTmEvHb9
	axRAlWss5s3zwqowisfuWkaWqlOGUGTCYDp+lTa2OQLQvn+vB5C7DdHl2DYnjVpu
	BakgmVCJ4dqRv+VnZYjnj225i8lCLhG8tRa7qC65Uh/rjV/g00b5vgFW77BU6vYw
	50qQCCnZFenpiiDGbbLv1vTmp1G59t5THjrc3v+aL9l9ZgWx8Wczr++TP1tDvbyM
	UuEp95mnLZRnqdhDlbAkHH5QdBqWvL8hdUpbJo+Axw==
X-ME-Sender: <xms:y3M1Y6JqQoFnxHUaAL5CeVaAcdS16GiTyD3KYVbfGNxx92-6q203hA>
    <xme:y3M1YyIPY8ZJyxGLQ3AgxUw0sglTQDBqvIBllcwzrljy44XCE9lgHIq2RJCKPqvoF
    BFLeXZFtGl7987t>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsegrtd
    erreerreejnecuhfhrohhmpedfpfhikhholhgruhhsucftrghthhdfuceonhhikhholhgr
    uhhssehrrghthhdrohhrgheqnecuggftrfgrthhtvghrnhephfelheetteegvdeltdduud
    euleffgfffleekieevhfegudegkefhkedtuefgteelnecuffhomhgrihhnpehrrghthhdr
    ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hnihhkohhlrghushesrhgrthhhrdhorhhg
X-ME-Proxy: <xmx:y3M1Y6tVft6u1GhrnQJNRArhJ9poPzEpboJZVWVIn0VYe-DwoYxujA>
    <xmx:y3M1Y_aHScUXPAAKhU47z-SJKrD6E-120YLN8yVFPUUmSSmm20BqeA>
    <xmx:y3M1Yxasgfesql79geIZSIThbl5dykwwR7jvN4TxAexmwak0P-lVQg>
    <xmx:y3M1Y0xX8ggEKiroPg3h2R64vkTZPhTrs4-scdT4WylQtSjqqCi66Q>
Feedback-ID: i53a843ae:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8068B2720078; Thu, 29 Sep 2022 06:30:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-968-g04df58079d-fm-20220921.001-g04df5807
Mime-Version: 1.0
Message-Id: <5275f1fe-8516-4f0d-8b47-62b9fec591ae@app.fastmail.com>
In-Reply-To: <ee18c441-0734-412e-8533-4ace1973a715@www.fastmail.com>
References: <ee18c441-0734-412e-8533-4ace1973a715@www.fastmail.com>
Date: Thu, 29 Sep 2022 11:30:15 +0100
From: "Nikolaus Rath" <nikolaus@rath.org>
To: libguestfs@redhat.com, nbd@other.debian.org,
 zfs-discuss@list.zfsonlinux.org, s3ql@googlegroups.com,
 s3backer-devel@googlegroups.com
Subject: ZFS-on-NBD - follow-up
Content-Type: multipart/alternative;
 boundary=66ab94c98f884d719ef83d4bcf77e3f7
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <BQrp9jDFBMN.A.5wB.iPXNjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2225
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5275f1fe-8516-4f0d-8b47-62b9fec591ae@app.fastmail.com
Resent-Date: Thu, 29 Sep 2022 10:30:58 +0000 (UTC)

--66ab94c98f884d719ef83d4bcf77e3f7
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Following up on my last post on this topic (since there seemed to be at =
least some interest): after evaluating the setup for a few weeks, I have=
 decided that this is not as good a solution as I had hoped.=20

In particular, the expected benefits of splitting data between a special=
 vdev backed by a bucket with small object size and a normal vdev backed=
 by a bucket with much larger object size did not materialize.

More details (including histograms) are available at https://www.rath.or=
g/zfs-on-nbd-my-verdict.html

Best,
-Nikolaus
--
GPG Fingerprint: ED31 791B 2C5C 1613 AF38 8B8A D113 FCAC 3C4E 599F

             =C2=BBTime flies like an arrow, fruit flies like a Banana.=C2=AB


--66ab94c98f884d719ef83d4bcf77e3f7
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">
p.MsoNormal,p.MsoNoSpacing{margin:0}</style></head><body><div>Hi,<br></d=
iv><div><br></div><div>Following up on my last post on this topic (since=
 there seemed to be at least some interest): after evaluating the setup =
for a few weeks, I have decided that this is not as good a solution as I=
 had hoped. <br></div><div><br></div><div>In particular, the expected be=
nefits of splitting data between a special vdev backed by a bucket with =
small object size and a normal vdev backed by a bucket with much larger =
object size did not materialize.<br></div><div><br></div><div>More detai=
ls (including histograms) are available at <a href=3D"https://www.rath.o=
rg/zfs-on-nbd-my-verdict.html">https://www.rath.org/zfs-on-nbd-my-verdic=
t.html</a><br></div><div><br></div><div>Best,<br>-Nikolaus<br></div><div=
 id=3D"sig33580657"><div class=3D"signature">--<br></div><div class=3D"s=
ignature">GPG Fingerprint: ED31 791B 2C5C 1613 AF38 8B8A D113 FCAC 3C4E =
599F<br></div><div class=3D"signature"><br></div><div class=3D"signature=
">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; =C2=BBTime flies like an arrow, fruit flies like a Banana.=C2=AB<br><=
/div><div class=3D"signature"><br></div></div><div><br></div></body></ht=
ml>
--66ab94c98f884d719ef83d4bcf77e3f7--

