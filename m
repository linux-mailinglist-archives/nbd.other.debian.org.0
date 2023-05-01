Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB2F6F3220
	for <lists+nbd@lfdr.de>; Mon,  1 May 2023 16:37:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 69FCF205B2; Mon,  1 May 2023 14:37:39 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May  1 14:37:39 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BEDE32057D
	for <lists-other-nbd@bendel.debian.org>; Mon,  1 May 2023 14:37:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HWCbx6IYsyhW for <lists-other-nbd@bendel.debian.org>;
	Mon,  1 May 2023 14:37:20 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A0ABE20581
	for <nbd@other.debian.org>; Mon,  1 May 2023 14:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=tIBTPV+6b5ItDAi9P1er4EnWwDlPSHiSr3pKSRQwey8=; b=JEh7oaJuOcnNFSGayHvMm21n7f
	i4NDjb1HTPQbgaZ9xRp7ram5fSDsKleYC5ltLAPgXIy2edYOS1vDFY1EYZDFI3ea+R+KCL2L9PA+R
	SxjwK1UMyug2QwUoGMYY3ZY4lY5eG3PRZjkIOddh4sCECNFvObxacCvmTWi7vOg5eNlx7qc1U+HkX
	5lVFWhfJWGU+yaQsmhRwE6/ON/htsaYEtd3ESgxZnLPH8WQoCqocBXkZV7lo323659URMytCPYI05
	bnxLcJj1ftkorAaifvnPi33qWnlLWVLidAPO9nfHUzzpeOjL/gwlDYf41QBAdaqicnOFhx0LDpwrJ
	5R9QUL1w==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1ptUeU-001jRm-C4
	for nbd@other.debian.org; Mon, 01 May 2023 16:37:17 +0200
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1ptUeK-000Kk4-2r
	for nbd@other.debian.org;
	Mon, 01 May 2023 16:37:08 +0200
Date: Mon, 1 May 2023 16:37:08 +0200
From: Wouter Verhelst <w@uter.be>
To: nbd@other.debian.org
Subject: NBD 3.25 released
Message-ID: <ZE/OlPmEptKrn7z+@pc220518.home.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JF6joZZSavP.A.RlF.z68TkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2459
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZE/OlPmEptKrn7z+@pc220518.home.grep.be
Resent-Date: Mon,  1 May 2023 14:37:39 +0000 (UTC)

Hi all,

NBD 3.25 has been released. It adds support for structured reply
messages in nbd-server, and fixes a run-time bug that popped up with
glib >= 2.76.

NOTE: in accordance with our further move to github and away from
sourceforge, this release for the first time can now be downloaded from
github, and not from sourceforge:

https://github.com/NetworkBlockDevice/nbd/releases/tag/nbd-3.25

Thanks,

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

