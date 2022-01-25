Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E1E49BD5E
	for <lists+nbd@lfdr.de>; Tue, 25 Jan 2022 21:44:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6F6E62066B; Tue, 25 Jan 2022 20:44:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan 25 20:44:43 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B521820407
	for <lists-other-nbd@bendel.debian.org>; Tue, 25 Jan 2022 20:44:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.827 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1vxid_J8dA5U for <lists-other-nbd@bendel.debian.org>;
	Tue, 25 Jan 2022 20:44:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id F0B3920475
	for <nbd@other.debian.org>; Tue, 25 Jan 2022 20:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643143466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HrWn0Cc9f3AcEWnZkLEJ/mD5OTXsWc/hBnT8ujCg5lg=;
	b=AISgVBDhVBr2wzLXMLoBOwyzMj/WFUOooC/pBtSooU68lVkr7c7WNg0GF9KatFpsUpQrWI
	bPrEe/u0hGFJKqbfvH+3ryj3wveqQKp39TN62c642LvcA8b9NGNp3FpNUtG79cOy+tuUN5
	plfXTApdrTdODNLlwmxcHjHDBZlTc3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-ORixtBiuPdODIDrGqzoPFQ-1; Tue, 25 Jan 2022 15:44:19 -0500
X-MC-Unique: ORixtBiuPdODIDrGqzoPFQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BB021800DB7;
	Tue, 25 Jan 2022 20:44:18 +0000 (UTC)
Received: from redhat.com (unknown [10.22.35.126])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CE50B18B8;
	Tue, 25 Jan 2022 20:44:17 +0000 (UTC)
Date: Tue, 25 Jan 2022 14:44:15 -0600
From: Eric Blake <eblake@redhat.com>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: nbd@other.debian.org, Wouter Verhelst <w@uter.be>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: Re: [PATCH 4/9] proto.md: Document historic values for magics,
 reserve new value
Message-ID: <20220125204415.23j534ozbfinoswg@redhat.com>
References: <20220121175711.5083-1-manfred@colorfullife.com>
 <20220121175711.5083-5-manfred@colorfullife.com>
MIME-Version: 1.0
In-Reply-To: <20220121175711.5083-5-manfred@colorfullife.com>
User-Agent: NeoMutt/20211029-229-9693dc
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YA-hwZkgOgL.A.00D.7EG8hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1706
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220125204415.23j534ozbfinoswg@redhat.com
Resent-Date: Tue, 25 Jan 2022 20:44:43 +0000 (UTC)

On Fri, Jan 21, 2022 at 06:57:06PM +0100, Manfred Spraul wrote:
> From: Manfred Spraul <manfred.spraul@de.bosch.com>
> 
> Right now:
> - The historic values for NBD_REQUEST_MAGIC and NBD_REPLY_MAGIC are
>   just documented in nbd.h, without any background.
> - The new value that is now used for internal use by nbd-server is
>   not documented at all.
> 
> Resolve that:
> - Add all required information to proto.md.
> - Remove the reserved magic values from nbd.h: proto.md is the
>   authorative source, double storage doesn't help.
> 
> Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
> ---
>  doc/proto.md | 12 ++++++++++++
>  nbd.h        |  1 -
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index 3a877a9..81ac755 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -458,6 +458,18 @@ SHOULD wait until there are no inflight requests first.
>  The client and the server MUST NOT initiate any form
>  of disconnect other than in one of the above circumstances.
>  
> +#### Reserved Magic values
> +
> +The following magic values are reserved and must not be used
> +for future protocol extentions:

extensions

> +
> +0x12560953 - Historic value for NBD_REQUEST_MAGIC, used
> +	     until Linux 2.1.116pre2.
> +0x96744668 - Historic value for NBD_REPLY_MAGIC, used
> +	     until Linux 2.1.116pre2.
> +0x25609514 - Used by nbd-server to store data log flags in the
> +	     transaction log. Never sent from/to a client.
> +

Seems reasonable to me.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

