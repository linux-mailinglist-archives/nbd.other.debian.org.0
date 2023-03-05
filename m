Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1658D6AAE99
	for <lists+nbd@lfdr.de>; Sun,  5 Mar 2023 09:42:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9F8EE2081A; Sun,  5 Mar 2023 08:42:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Mar  5 08:42:08 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 727E720819
	for <lists-other-nbd@bendel.debian.org>; Sun,  5 Mar 2023 08:41:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nyDy8Yyitw-T for <lists-other-nbd@bendel.debian.org>;
	Sun,  5 Mar 2023 08:41:51 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6599E20818
	for <nbd@other.debian.org>; Sun,  5 Mar 2023 08:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=uch1Db0E384wjqhT0+t9Pq7ufXw2sFMAY+qAv5fFn0A=; b=pm68ZAUfkPLzdzF8liz+a84QzS
	56X7qeWZKrf9yY9x2hT0766ps8lv2cNYcN6HZFMkaSGu1B6oKGolHdd9idbC/5/o9XzJT3MtmJz5n
	UgFeVyla4vLHVTXE9MG6qHbANUMvxeICAZZuVV7v/j0P6BGXtRUf6cHGzgo7ZaAnO9saEI4QOuNsO
	uNAPCv7ocvBZmRiwg3Ega7OmM1CGr//hEE7QoWpEzYozpfxq5Qv+mbW4plQ/PSr2JUGVVmlbrsq5J
	X5MiHgUGcylRCOusFnGbsiF1/LIR23C8f6taER85wjjkCeT5+bs2frmBBpteAmPPlwLD7Quym+xr4
	3Sj438ww==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1pYjw8-0003sk-3M; Sun, 05 Mar 2023 09:41:44 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1pYjw1-000Rlk-06;
	Sun, 05 Mar 2023 10:41:37 +0200
Date: Sun, 5 Mar 2023 10:41:37 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: Re: [PATCH v2 1/6] spec: Recommend cap on
 NBD_REPLY_TYPE_BLOCK_STATUS length
Message-ID: <ZARVwVaRJbgvv/fO@pc220518.home.grep.be>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-2-eblake@redhat.com>
 <f350f0ec-34b1-dca7-5bb0-344a6832f327@yandex-team.ru>
 <20230303221740.pdwc6jtozstntih7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303221740.pdwc6jtozstntih7@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <KebtW8FSQ3L.A.np.gXFBkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2348
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZARVwVaRJbgvv/fO@pc220518.home.grep.be
Resent-Date: Sun,  5 Mar 2023 08:42:08 +0000 (UTC)

On Fri, Mar 03, 2023 at 04:17:40PM -0600, Eric Blake wrote:
> On Fri, Dec 16, 2022 at 10:32:01PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > s-o-b line missed.
> 
> I'm not sure if the NBD project has a strict policy on including one,
> but I don't mind adding it.

I've never required it, mostly because it's something that I myself
always forget, too, so, *shrug*.

(if there were a way in git to make it add that automatically, that
would help; I've looked but haven't found it)

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

