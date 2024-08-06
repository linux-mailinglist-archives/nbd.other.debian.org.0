Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 208B1948A88
	for <lists+nbd@lfdr.de>; Tue,  6 Aug 2024 09:49:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 05D4320666; Tue,  6 Aug 2024 07:49:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug  6 07:49:27 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0CB4D20662
	for <lists-other-nbd@bendel.debian.org>; Tue,  6 Aug 2024 07:49:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Bvcoyq_vvjSn for <lists-other-nbd@bendel.debian.org>;
	Tue,  6 Aug 2024 07:49:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3D8AD20635
	for <nbd@other.debian.org>; Tue,  6 Aug 2024 07:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3G8kWmCY8+8ycTTQtwqTo5kt3QPEPxhAtSHYBuxzt1E=; b=gdqWBr2OGUd+hdjhz2vxPeQx2g
	tYa1cZgdCCmtGvBVJKiqukSWovODXy9AF73NwJ8Qf/AtniKznQVGWkmU9jMDTVhzvayS875AjGTaX
	7TO4T/IjNtQpk62abcOGI5Sx5HaQYoxJbxTOqz6DdOD3GJ7NxXLTAW0e//OUc8C9ctLhOgqA/1wPC
	jM2HvgAqVfS0/4J9CwQLVMZmh2UpNSd5rZpv0TMDr1j2RUi/xrw0ylbEDIITVYoOE9RBiZ8IMtTAS
	DkVU2LJuOcvUksG2bPXPc1xCtdHEQOHJbrpsmKIraWzT3Eu69PCw17ZFY8paloR5DuQybcWY1LfDD
	tuR/PPBA==;
Received: from [102.39.154.62] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1sbEwP-00EW3a-1L;
	Tue, 06 Aug 2024 09:49:09 +0200
Received: from wouter by pc220518 with local (Exim 4.98)
	(envelope-from <w@uter.be>)
	id 1sbEwH-000000002oc-0XVH;
	Tue, 06 Aug 2024 09:49:01 +0200
Date: Tue, 6 Aug 2024 09:49:01 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] nbd: implement the WRITE_ZEROES command
Message-ID: <ZrHVbQ5_lvCCegK_@pc220518.home.grep.be>
References: <20240803130432.5952-1-w@uter.be>
 <f2kaityrjmmstzvqq7xu755ikstida2hcnnng634oeo6fxjfbj@zrgbeik6fwz6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2kaityrjmmstzvqq7xu755ikstida2hcnnng634oeo6fxjfbj@zrgbeik6fwz6>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <aFY8gzttzuI.A.I_MH.HWdsmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3120
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZrHVbQ5_lvCCegK_@pc220518.home.grep.be
Resent-Date: Tue,  6 Aug 2024 07:49:28 +0000 (UTC)

On Mon, Aug 05, 2024 at 07:52:42AM -0500, Eric Blake wrote:
> On Sat, Aug 03, 2024 at 03:04:30PM GMT, Wouter Verhelst wrote:
> > The NBD protocol defines a message for zeroing out a region of an export
> > 
> > Add support to the kernel driver for that message.
> > 
> > Signed-off-by: Wouter Verhelst <w@uter.be>
> > ---
> >  drivers/block/nbd.c      | 8 ++++++++
> >  include/uapi/linux/nbd.h | 5 ++++-
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > index 5b1811b1ba5f..215e7ea9a3c3 100644
> > --- a/drivers/block/nbd.c
> > +++ b/drivers/block/nbd.c
> > @@ -352,6 +352,8 @@ static int __nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
> >  	}
> >  	if (nbd->config->flags & NBD_FLAG_ROTATIONAL)
> >  		lim.features |= BLK_FEAT_ROTATIONAL;
> > +	if (nbd->config->flags & NBD_FLAG_SEND_WRITE_ZEROES)
> > +		lim.max_write_zeroes_sectors = UINT_MAX;
> 
> Is that number accurate, when the kernel has not yet been taught to
> use 64-bit transactions and can therefore only request a 32-bit byte
> length on any one transaction?  Would a better limit be
> UINT_MAX/blksize?

Thanks, good catch.

I copied the logic from the handling of the TRIM command (i.e., the
discard logic), which has the same flawed UINT_MAX behavior. I will fix
this in v2 and add a fix for the discard code.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

