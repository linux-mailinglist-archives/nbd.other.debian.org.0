Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C729F6AAE9D
	for <lists+nbd@lfdr.de>; Sun,  5 Mar 2023 09:49:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9EFA52081E; Sun,  5 Mar 2023 08:49:49 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Mar  5 08:49:49 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 58FBC205AF
	for <lists-other-nbd@bendel.debian.org>; Sun,  5 Mar 2023 08:49:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id MU20og8wzkzw for <lists-other-nbd@bendel.debian.org>;
	Sun,  5 Mar 2023 08:49:32 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3B0942058A
	for <nbd@other.debian.org>; Sun,  5 Mar 2023 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oEISQ1BfHwYx1j9chjZWF4H3DuFNS9Lk8DZW+8tnHuc=; b=pOidGulYgK0F9MPMnQzs/zhWrF
	7tWNwxT0duS6zOLKmHLlYiTvzVHBXkSNYfdz9DhU9GmW0dBLKLKOdcZbhg3u7mV6ErSvR5j/kw+Wl
	07Jd8h7cyFRT1aby2eucCp2JybNB9iIvw9td+hCCTrUxakakQf2mmh4AWYzwnrQML549JmWrgAaXv
	43hTKmqj/FpwB1Emfbf8dPi44FGsnvsGd7cuV0YzbNqfZuNPL5bpjlIhGX0rZcnqj+XZ9fz1/gbWU
	52g8xXL034LO7kUdu6KxsMimHkVaGChyhv8Rt1XeU+UkPscvjt2Y9TaAo0jD2KzgLyp/GAGmvhwRf
	Hnh75GLA==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1pYk3c-00071F-MW; Sun, 05 Mar 2023 09:49:28 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1pYk3V-000Scs-1S;
	Sun, 05 Mar 2023 10:49:21 +0200
Date: Sun, 5 Mar 2023 10:49:21 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: Re: [PATCH v2 3/6] spec: Add NBD_OPT_EXTENDED_HEADERS
Message-ID: <ZARXkaG3cq9bi4XF@pc220518.home.grep.be>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-4-eblake@redhat.com>
 <Y/XlHhLWwm2pZ4RL@pc220518.home.grep.be>
 <20230303223641.utbls7mggek7quqx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303223641.utbls7mggek7quqx@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <a4YJDiXY0_K.A.42C.teFBkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2350
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZARXkaG3cq9bi4XF@pc220518.home.grep.be
Resent-Date: Sun,  5 Mar 2023 08:49:49 +0000 (UTC)

On Fri, Mar 03, 2023 at 04:36:41PM -0600, Eric Blake wrote:
> On Wed, Feb 22, 2023 at 11:49:18AM +0200, Wouter Verhelst wrote:
> > On Mon, Nov 14, 2022 at 04:46:52PM -0600, Eric Blake wrote:
[...]
> > > +  Note that even when extended headers are in use, the client MUST be
> > > +  prepared for the server to use either the compact or extended chunk
> > > +  type, regardless of whether the client's hinted effect length was
> > > +  more or less than 32 bits; but the server MUST use exactly one of
> > > +  the two chunk types per negotiated metacontext ID.
> > 
> > Is this last paragraph really a good idea? I would think it makes more
> > sense to require the new format if we're already required to support it
> > on both sides anyway.
> 
> My proof of implementation was easier to code when I didn't have to
> resize the block status reply sizing in the same patch as adding the
> 64-bit headers.  But if you think requiring the 64-bit reply type
> always (and forbidding the 32-bit reply) when extended headers are in
> force, that's also possible.

Intuitively, this sounds off. It would seem to me that it's easier to do
if you don't have to have a conditional on each received data packet.
But maybe I'm missing something -- I haven't done an implementation yet,
anyway.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

