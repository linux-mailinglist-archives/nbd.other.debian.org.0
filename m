Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9758551E01F
	for <lists+nbd@lfdr.de>; Fri,  6 May 2022 22:26:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7CA302039D; Fri,  6 May 2022 20:26:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May  6 20:26:16 2022
Old-Return-Path: <Nikolaus@rath.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 840B720380
	for <lists-other-nbd@bendel.debian.org>; Fri,  6 May 2022 20:26:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.808 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cipeGaesxx-K for <lists-other-nbd@bendel.debian.org>;
	Fri,  6 May 2022 20:26:03 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .rath. - helo: .out1-smtp.messagingengine. - helo-domain: .messagingengine.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 155BE20379
	for <nbd@other.debian.org>; Fri,  6 May 2022 20:26:02 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 7C6625C0118
	for <nbd@other.debian.org>; Fri,  6 May 2022 16:25:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 06 May 2022 16:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rath.org; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1651868758; x=1651955158; bh=coBLHoveJ9
	xTyAO/utpDGsp0Z5Ec/cXOpw0Ysw0tFSo=; b=vFo3z0FoiQGqB8A3qDf41zk3tT
	OW8adffizpPE69ykzy3yHRH/K2jNnmYxnm4NJX3a/ghLyiWN2mqV/9QJMZ6PIcEr
	UMYjD+ugeVry4E0jx6BA8BJAXWgZTKo6UEnEtAQUfgHnn+GSxIYOj93cOskkHyrR
	QevgtYC9eQSHunYT11ObCfZ4HUc8A0ATxkJKfX/xCy4qtzzwi23lgTEYgRVvjqZS
	P48VHGOo29UHqJapu3Lw5trgQgJXCBjY4yjooszxuVuq6KWKklDwLnFFphYehKar
	GWWKpc5sk5syOkN1AFku6NxLh9aIG90AGC6ml01AMW/DH9ohPlhiit0DQLiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651868758; x=
	1651955158; bh=coBLHoveJ9xTyAO/utpDGsp0Z5Ec/cXOpw0Ysw0tFSo=; b=N
	LJTEWFwA8MJN3nTmPwGDWOmMbdAg/W5OUw3Ed8s+K278Ov6QjwQFmNZnmOUsZHtu
	oNiNSF9FZ3iQnw2Qm6ftailvn332LgLXmqntIfY1TW6McpAulAFP18tMDFABTQpX
	PybqdGoR+u6rG9wGt67gvqsOL3lbHddJrc3Gdm+JGKDTFuY5tk6jEQYu9QGAL/cf
	egr0cPOSbzT9A6l3htgXE+EAqaN559avAMZO+AGNCbpobtWkqP2/Gcb7glMAt4CT
	9UOG3VliPFKWLRcBnd3Fw2vc6+VFmpNEM8QnTdquOIf5q0h/qfTjlXy1AYj8rNEx
	FO97uUKHimMcOILTvbKKQ==
X-ME-Sender: <xms:VoR1YgNcBcblQvACVSREh3rLQz6zQ2FSH232fSWLZos1t8LMkIXALA>
    <xme:VoR1Ym_7rNWtpP1ghwjUeiAOZnJfAmunCzCQxO5C6Vw1T8GE7JSx3JsfKOSz7Be-u
    2E9dRN2rouDNR9->
X-ME-Received: <xmr:VoR1YnQgQWgU8IcRv9iRMEye0FEV5Cnk_ZL8rk56m29mnDKyK2xUK1Px5Z5iyAFAk1ZG2cioR8U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgddugeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkfgggtgfgsehtqhdttd
    dtreejnecuhfhrohhmpefpihhkohhlrghushcutfgrthhhuceopfhikhholhgruhhssehr
    rghthhdrohhrgheqnecuggftrfgrthhtvghrnhepffeuieevteehkeehfedugfegfeejve
    ekvddvjeeuveegheekleegkefhteduffehnecuffhomhgrihhnpehrvgguhhgrthdrtgho
    mhdprhgrthhhrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomheppfhikhholhgruhhssehrrghthhdrohhrgh
X-ME-Proxy: <xmx:VoR1Yot1tq4SEeUXgKqWiPs_mR4i3fvcqTUlEeWVJ6yOw1dlXAuWAQ>
    <xmx:VoR1YoeysnOiY3c-vGMGES3N50pmCGednqnvrtViSpwRNY90VWr1sA>
    <xmx:VoR1Ys3p1fYemvVMmx0JPPuDPhGFc_vn7x6wpoWQ0W_fYhkYXjuV3w>
    <xmx:VoR1YprpOEqA34o9sDQf8nNcftHznunZ0Ii0zjS2dIzlLMzzolpiRw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <nbd@other.debian.org>; Fri, 6 May 2022 16:25:58 -0400 (EDT)
Received: from vostro.rath.org (vostro [192.168.12.4])
	by ebox.rath.org (Postfix) with ESMTPS id 62ACE94D
	for <nbd@other.debian.org>; Fri,  6 May 2022 20:25:56 +0000 (UTC)
Received: by vostro.rath.org (Postfix, from userid 1000)
	id CACA4C01E1; Fri,  6 May 2022 21:25:55 +0100 (BST)
From: Nikolaus Rath <Nikolaus@rath.org>
To: nbd@other.debian.org
Subject: How to safely disconnect NBD device
Date: Fri, 06 May 2022 21:25:55 +0100
Message-ID: <87o80awgq4.fsf@vostro.rath.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LPbdQYM2PS.A.bAE.oRYdiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2061
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/87o80awgq4.fsf@vostro.rath.org
Resent-Date: Fri,  6 May 2022 20:26:16 +0000 (UTC)

Hello,

(Following up from
https://listman.redhat.com/archives/libguestfs/2022-May/028820.html)

I was experimenting with nbd, and found that running a command like:

$ nbd-client localhost /dev/nbd1 && mkfs.ext4 /dev/nbd1 && nbd-client -d
/dev/nbd1

Frequently gives me errors like this:

May 02 15:20:50 vostro.rath.org kernel: nbd1: detected capacity change from=
 0 to 52428800
May 02 15:20:50 vostro.rath.org kernel: block nbd1: NBD_DISCONNECT
May 02 15:20:50 vostro.rath.org kernel: block nbd1: Disconnected due to use=
r request.
May 02 15:20:50 vostro.rath.org kernel: block nbd1: shutting down sockets
May 02 15:20:50 vostro.rath.org kernel: I/O error, dev nbd1, sector 776 op =
0x0:(READ) flags 0x80700 phys_seg 29 prio class 0
May 02 15:20:50 vostro.rath.org kernel: I/O error, dev nbd1, sector 776 op =
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
May 02 15:20:50 vostro.rath.org kernel: Buffer I/O error on dev nbd1, logic=
al block 97, async page read
May 02 15:20:50 vostro.rath.org kernel: block nbd1: Attempted send on inval=
id socket
May 02 15:20:50 vostro.rath.org kernel: I/O error, dev nbd1, sector 0 op 0x=
1:(WRITE) flags 0x800 phys_seg 0 prio class 0
May 02 15:20:50 vostro.rath.org kernel: block nbd1: Attempted send on inval=
id socket
May 02 15:20:50 vostro.rath.org kernel: I/O error, dev nbd1, sector 0 op 0x=
1:(WRITE) flags 0x800 phys_seg 0 prio class 0


To me, this looks as if the kernel is shutting down the NBD connection
while there are still active requests and/or while there is still dirty
data that needs to be flushed.

Is this expected behavior?

If so, what is the recommended way to *safely* disconnect an NBD device?

Best,
-Nikolaus

--=20
GPG Fingerprint: ED31 791B 2C5C 1613 AF38 8B8A D113 FCAC 3C4E 599F

             =C2=BBTime flies like an arrow, fruit flies like a Banana.=C2=
=AB

