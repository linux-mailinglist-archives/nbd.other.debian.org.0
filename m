Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E624CBA60
	for <lists+nbd@lfdr.de>; Thu,  3 Mar 2022 10:36:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 44A7620EDC; Thu,  3 Mar 2022 09:36:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar  3 09:36:09 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 6ACB020ED8
	for <lists-other-nbd@bendel.debian.org>; Thu,  3 Mar 2022 09:36:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.19 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id wHqzX8ikw6lg for <lists-other-nbd@bendel.debian.org>;
	Thu,  3 Mar 2022 09:35:56 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7F94F20EBB
	for <nbd@other.debian.org>; Thu,  3 Mar 2022 09:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=tzYxmAkryg4rU8qpC6z2EBHydNFOZugA+BbYUWpjYVI=; b=ltRDjbNW7whwpqga4ZRH5bPyIN
	95RqzJQxpaVBWcBhHqugMsizdEq8WQ7Cx4bdbTLjgodLL+mEV25IMFjc9lgiyNmnztmvDZmNpBJ3W
	cHvMhDDmPn9PPMnP3BHtJUSVWC9GuMFaX26wmLIHrt2onu3xpXZWOnX13P7mEMnpFFQEkRBiJEYfI
	Ld0J/tGC+HBxBQZMyzc2rWn+xQ522XxY9Z4lemTQlvHSvgsMliDP59WhcdA+fyq/RDQC70v95kOmZ
	zf5EjC1uRTiWdOqaEpPkEC90HN5vRF8hgF7PQacfWLKAM6N7allTd+U1w25Iuwy7etRKUi4IUKmms
	kNXBeJEg==;
Received: from [196.251.239.242] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1nPhsI-005hUM-0k; Thu, 03 Mar 2022 10:35:54 +0100
Received: from wouter by pc181009 with local (Exim 4.95)
	(envelope-from <w@uter.be>)
	id 1nPhsE-000Ad8-J5;
	Thu, 03 Mar 2022 11:35:50 +0200
Date: Thu, 3 Mar 2022 11:35:50 +0200
From: Wouter Verhelst <w@uter.be>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: nbd@other.debian.org, Eric Blake <eblake@redhat.com>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: Re: [PATCH 2/9] nbd-server, nbd-trdump: Add support for logging
 actual data
Message-ID: <YiCL9iQWk06/AuGZ@pc181009.grep.be>
References: <20220121175711.5083-1-manfred@colorfullife.com>
 <20220121175711.5083-3-manfred@colorfullife.com>
 <YiCLt2SL/Dc4f4Mt@pc181009.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiCLt2SL/Dc4f4Mt@pc181009.grep.be>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <OMs19Y3EiFE.A.8ZB.JwIIiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1719
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YiCL9iQWk06/AuGZ@pc181009.grep.be
Resent-Date: Thu,  3 Mar 2022 09:36:09 +0000 (UTC)

On Thu, Mar 03, 2022 at 11:34:47AM +0200, Wouter Verhelst wrote:
> This feels like overkill to me.
> 
> We might want a mutex just so that multiple writes handled on multiple
> threads don't corrupt the file (I don't know whether that's the case
> currently), but beyond that I don't think it's worth the extra effort.

nvm, I see you already did that in the next patch. Ignore.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

