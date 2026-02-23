Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IBFM7IgnGkZ/wMAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 23 Feb 2026 10:41:06 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 71399174101
	for <lists+nbd@lfdr.de>; Mon, 23 Feb 2026 10:41:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9BF78204FA; Mon, 23 Feb 2026 09:41:05 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 23 09:41:05 2026
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 30325204E2
	for <lists-other-nbd@bendel.debian.org>; Mon, 23 Feb 2026 09:40:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6I-TKvaqpPcX for <lists-other-nbd@bendel.debian.org>;
	Mon, 23 Feb 2026 09:40:49 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id F356A20409
	for <nbd@other.debian.org>; Mon, 23 Feb 2026 09:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l7ur/xMoIwQ2QmfUHV3rfzePMQaZM3DKESy7NxWDgx8=; b=gqxjkDRMi7UMD8moDQ7aD/9Mxa
	rsXMoJy5UeyWwvNNBxUgyP4vQXsGZpxY/B0qa/2FR7ThWKP7mrhZHFoLstJljE9hWt3UC05uCJGkW
	kJqb0IIMN83A25VYXzzIbfDFEXBh09pNqJSHlZzbPCTo9gvWcQvp1+pE3VhWa7XWnJYYIDf3MXL2r
	q9Vww+gEZs/lMrOHEH/4+TYXHcyUh/N/X3qsmSMOlcqMN8YkoXuk2TJcFHwi5PZ9j3H/udfXw1NH2
	sB+qvScv+YCHGgX96t1wM4KM2gvgWn44NXzeEqDpu8gHz7QK3iw4Q6uKthh/2cz9Vx8dalwiVbBRP
	t4rdB6QQ==;
Received: from [102.39.233.88] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <w@uter.be>)
	id 1vuSQg-0000000F0gb-2Jmf;
	Mon, 23 Feb 2026 10:40:38 +0100
Received: from wouter by pc220518 with local (Exim 4.99.1)
	(envelope-from <w@uter.be>)
	id 1vuSQU-00000000uTV-3zJQ;
	Mon, 23 Feb 2026 11:40:26 +0200
Date: Mon, 23 Feb 2026 11:40:26 +0200
From: Wouter Verhelst <w@uter.be>
To: Hristo Venev <hristo@venev.name>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org
Subject: Re: [PATCH] netlink: specs: add specification for NBD
Message-ID: <aZwgiv0vPWPybUF-@pc220518.home.grep.be>
References: <20260215180309.2255721-3-hristo@venev.name>
 <m2o6lnlg2y.fsf@gmail.com>
 <6a1339999b091edaaa15e34aceb7961dfc61581b.camel@venev.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a1339999b091edaaa15e34aceb7961dfc61581b.camel@venev.name>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <H8_Pva47CyI.A.BI8B.xCCnpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3501
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/aZwgiv0vPWPybUF-@pc220518.home.grep.be
Resent-Date: Mon, 23 Feb 2026 09:41:05 +0000 (UTC)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[uter.be:s=2021.lounge];
	MAILLIST(-0.20)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[uter.be : No valid SPF,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hristo@venev.name,m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:netdev@vger.kernel.org,m:josef@toxicpanda.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:donaldhunter@gmail.com,s:lists@lfdr.de];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_SENDER(0.00)[w@uter.be,bounce-nbd=lists@other.debian.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,vger.kernel.org,toxicpanda.com,kernel.dk,other.debian.org];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[uter.be:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[w@uter.be,bounce-nbd=lists@other.debian.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 71399174101
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 07:40:33PM +0200, Hristo Venev wrote:
> On Tue, 2026-02-17 at 12:17 +0000, Donald Hunter wrote:
> > There are yamllint errors:
> > 
> > make -C tools/net/ynl lint
> > make: Entering directory '/home/donaldh/net-next/tools/net/ynl'
> > yamllint ../../../Documentation/netlink/specs
> > ../../../Documentation/netlink/specs/nbd.yaml
> >   159:81    error    line too long (104 > 80 characters)  (line-
> > length)
> >   169:6     error    syntax error: expected <block end>, but found
> > '<block mapping start>' (syntax)
> >   170:7     error    wrong indentation: expected 5 but found 6 
> > (indentation)
> 
> Thanks, I will fix the lint errors in v2.
> 
> > > +doc: See :file:`drivers/block/nbd.c`
> > 
> > Prefer to see a meaningful doc string here.
> 
> I will add more proper documentation in v2. I couldn't find any
> existing documentation of this netlink interface, so I guess I will
> write it myself.

As luck would have it, before I saw this message, I had been wanting to
work on some of the messages that nbd-client still needed, and so I
asked an LLM to analyze the code and generate some docs for me.

Heed the "LLM" part. It's probably not perfect. But it could be a good
starting point. Or not. At any rate, you can find it here:

https://github.com/NetworkBlockDevice/nbd/blob/master/doc/netlink-proto.md

-- 
"I never had a C in history!"
"Yeah, but there was so much less of it when you were my age!"
 -- Joe Brockmeier recounting a conversation with his father, cfgmgmtcamp 2026, Ghent

