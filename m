Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEB24CBB10
	for <lists+nbd@lfdr.de>; Thu,  3 Mar 2022 11:13:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2115020EF5; Thu,  3 Mar 2022 10:13:38 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar  3 10:13:38 2022
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 43D8520EF3
	for <lists-other-nbd@bendel.debian.org>; Thu,  3 Mar 2022 10:13:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.19 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id B_CPZwRY98sN for <lists-other-nbd@bendel.debian.org>;
	Thu,  3 Mar 2022 10:13:25 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B04D820EDF
	for <nbd@other.debian.org>; Thu,  3 Mar 2022 10:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=214V2vMQOYOZeb0fARAmiFURIIF66By4rc1Yw/V49NA=; b=lYvcTLLNqJ0VrXN32T4VFN8XPP
	Mj+AlTO2ffvAGJK3plVeCru8J4M8Ge5FZkGTwIhP67hZq4lGj69X0wnPQAY+I1fx4bQTFgDwNBeFj
	ZawhpJfvQLVra909teb/a1+F/dbwj7xww8MY71DYVWv/XHcfmQjbEVaFnN0bZHK1SzTAVwbhllx/8
	x3shhIgkSP6ZWMF2xMYjSL5zlUVMWnWioftgRznRCewrHynNiS8d7pWRAbe+pXxVzP+rtDH91wp66
	ytoDRAWMZD9Ev9lJgMVFlQK+w/e1mzqI/t9hh/kwzjsDPWLVYkfX5W4yZExgabWLGobHqhUjElMRn
	0/wjNtTQ==;
Received: from [196.251.239.242] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1nPiSY-005ylj-LH; Thu, 03 Mar 2022 11:13:22 +0100
Received: from wouter by pc181009 with local (Exim 4.95)
	(envelope-from <w@uter.be>)
	id 1nPiSU-000BOy-G0;
	Thu, 03 Mar 2022 12:13:18 +0200
Date: Thu, 3 Mar 2022 12:13:18 +0200
From: Wouter Verhelst <w@uter.be>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: nbd@other.debian.org, Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 0/9] Add data to datalog, add replay tool, V03
Message-ID: <YiCUvrvGpn2Ip1Le@pc181009.grep.be>
References: <20220121175711.5083-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220121175711.5083-1-manfred@colorfullife.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0tMlr5KWI8K.A.xNG.STJIiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1720
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YiCUvrvGpn2Ip1Le@pc181009.grep.be
Resent-Date: Thu,  3 Mar 2022 10:13:38 +0000 (UTC)

Hi Manfred,

On Fri, Jan 21, 2022 at 06:57:02PM +0100, Manfred Spraul wrote:
> Hi,
> 
> Updated series.
> New is:
> - Patch 0004: Update proto.md
> - Patch 0009: An initial man page.
> 
> Review feedback is welcome!

I had a detailed look today, but didn't have any further feedback.

> And: What else is needed for a new tool?
> Should I try to create a test case?

A new test case might be useful, yes.

Note that there are two (somewhat old by now) transaction logs in
tests/run ("integrity-test.tr" and "integrityhuge-test.tr") that you
might want to look at.

It could be useful to update nbd-tester-client to also support the new
transaction log format. Currently we just write zeroes, which works but
is not ideal; with actual data we might be able to compare checksums etc
afterwards.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

