Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2021D523098
	for <lists+nbd@lfdr.de>; Wed, 11 May 2022 12:21:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 059BC20369; Wed, 11 May 2022 10:21:45 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 11 10:21:44 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 1D874200F9
	for <lists-other-nbd@bendel.debian.org>; Wed, 11 May 2022 10:21:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.808 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YhLp9ZaULoaK for <lists-other-nbd@bendel.debian.org>;
	Wed, 11 May 2022 10:21:31 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 21EEB202EF
	for <nbd@other.debian.org>; Wed, 11 May 2022 10:21:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 16EF85C01E7;
	Wed, 11 May 2022 06:21:27 -0400 (EDT)
Received: from imap45 ([10.202.2.95])
  by compute4.internal (MEProxy); Wed, 11 May 2022 06:21:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rath.org; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1652264487; x=
	1652350887; bh=4JiqeFG+olKRG80HFDyukJYU+zaxTubcnJIz5T/0zXY=; b=s
	4qteUtCp8WZLTUCgmITjkPN/9I41acECbrxbzZ5dxggzmIgufsTNZTfSW2vofHN8
	85EPmyn8mEhs4LV74HCWWSydhY/cETsNHJ77KxoetPnKekG6QMuTh86tsuR27l/h
	jNbPmjngk+PViTrXewVYXL3AevXURMtl9Cav2iupg0N9jqa6PF/Y8he5Ca9AyMIT
	krwqD6Wk98QgFNxbp1L3l9bTGCRs/+cOBFMB+6hSBr35yD0pNxNv6H/v72XWeSBj
	M1sP74YPfHjYE1PT3Dcp7LA5SDZfS32yojE3Z+nmm4kOY2BY8T1tgA7uS2L1E27T
	GN8XDkznKnUE4sXvNqziA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1652264487; x=1652350887; bh=4JiqeFG+olKRG
	80HFDyukJYU+zaxTubcnJIz5T/0zXY=; b=G+NNnaeTGE/VVYakYCaRrMw2XIkZD
	cCn62DftO0PVNdNMjfyOLIyT1VcMhe2jxf4V9kaIxDgm0lFMaznW3AwuGEVsnzyN
	HQekDRIq0qW98/b0aerAysIijwbWwT2m27kXmrj/SP37j2V65wjOGWTggmxVRnPp
	It5fnQMn0V2eU+w6+SSfpgyxCjXgHPjjfWH+uptG2wp6cqU8qY5ho82Tw9usPyxa
	3AvdQMHaH06NzLCRPEO/uDl2nLJqPQrnDjqC9g5UbH6tAkKp3rFGRwnPL87nmX9g
	sUH66gQ+1fzz6nvKsia8wnZSyt1eJtXGS5DiMt2Gk4PYcRS3XUJfFfA5A==
X-ME-Sender: <xms:Jo57Yqr_aVPkkQebKNpSVo4CqvKifH7RaZml0M02hyCJhopfO_hEfg>
    <xme:Jo57YoqzgiTpxjtPDm2bIq6nqJBsSgUqCGKVBQhwNUO1s6sEZd9LXjDMXMulunkSF
    PuAeGsGmHtZlRp4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgddvgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedfpfhi
    khholhgruhhsucftrghthhdfuceopfhikhholhgruhhssehrrghthhdrohhrgheqnecugg
    ftrfgrthhtvghrnhepkefgfeefuedvteejgfdvveetvefhtdfgtdejvedvhfejkefhfeek
    feejtedtveetnecuffhomhgrihhnpehrrghthhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpefpihhkohhlrghushesrhgrthhhrdho
    rhhg
X-ME-Proxy: <xmx:Jo57YvPFjB898soOxDMY5s2Y-w7-W-xElB4iCiE1ntSyEjXhPou_ig>
    <xmx:Jo57Yp4GsGOte8Z1mCl-p8LEw8CxLDcGBO5Gjg0cE6k_V5wyyBzM_w>
    <xmx:Jo57Yp6J0PErbHDBN0zkA_hPhVkWmG5_TvxloppiJiEElGsCaEiymQ>
    <xmx:J457YpHs-3M2RDGYiPT4LOaDt3auRWhqUiZQH6tFuEd_9ChpMo87Gw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CE2DF272006B; Wed, 11 May 2022 06:21:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-591-gfe6c3a2700-fm-20220427.001-gfe6c3a27
Mime-Version: 1.0
Message-Id: <eea9f80f-a690-4eda-9416-5137d06d9ff3@www.fastmail.com>
In-Reply-To: <87o80awgq4.fsf@vostro.rath.org>
References: <87o80awgq4.fsf@vostro.rath.org>
Date: Wed, 11 May 2022 11:21:06 +0100
From: "Nikolaus Rath" <Nikolaus@rath.org>
To: "Paul Clements" <Paul.Clements@steeleye.com>
Cc: nbd@other.debian.org
Subject: Re: How to safely disconnect NBD device
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tEAwGMdkUI.A.B3B.444eiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2062
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/eea9f80f-a690-4eda-9416-5137d06d9ff3@www.fastmail.com
Resent-Date: Wed, 11 May 2022 10:21:45 +0000 (UTC)

Hi Paul,=20

Would you be able to help with the question below? I've been told that y=
ou're the current maintainer of the NBD kernel code..

On Fri, 6 May 2022, at 21:25, Nikolaus Rath wrote:
> $ nbd-client localhost /dev/nbd1 && mkfs.ext4 /dev/nbd1 && nbd-client =
-d
> /dev/nbd1
>
> Frequently gives me errors like this:
>
> May 02 15:20:50 vostro.rath.org kernel: nbd1: detected capacity change=20
> from 0 to 52428800
> May 02 15:20:50 vostro.rath.org kernel: block nbd1: NBD_DISCONNECT
> May 02 15:20:50 vostro.rath.org kernel: block nbd1: Disconnected due t=
o=20
> user request.
> May 02 15:20:50 vostro.rath.org kernel: block nbd1: shutting down=20
> sockets
> May 02 15:20:50 vostro.rath.org kernel: I/O error, dev nbd1, sector 77=
6=20
> op 0x0:(READ) flags 0x80700 phys_seg 29 prio class 0
> May 02 15:20:50 vostro.rath.org kernel: I/O error, dev nbd1, sector 77=
6=20
> op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> May 02 15:20:50 vostro.rath.org kernel: Buffer I/O error on dev nbd1,=20
> logical block 97, async page read
> May 02 15:20:50 vostro.rath.org kernel: block nbd1: Attempted send on=20
> invalid socket
> May 02 15:20:50 vostro.rath.org kernel: I/O error, dev nbd1, sector 0=20
> op 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0
> May 02 15:20:50 vostro.rath.org kernel: block nbd1: Attempted send on=20
> invalid socket
> May 02 15:20:50 vostro.rath.org kernel: I/O error, dev nbd1, sector 0=20
> op 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0
>
> To me, this looks as if the kernel is shutting down the NBD connection
> while there are still active requests and/or while there is still dirty
> data that needs to be flushed.
>
> Is this expected behavior?
>
> If so, what is the recommended way to *safely* disconnect an NBD devic=
e?


Best,
-Nikolaus

--
GPG Fingerprint: ED31 791B 2C5C 1613 AF38 8B8A D113 FCAC 3C4E 599F

             =C2=BBTime flies like an arrow, fruit flies like a Banana.=C2=AB

