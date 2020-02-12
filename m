Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3FB15A968
	for <lists+nbd@lfdr.de>; Wed, 12 Feb 2020 13:47:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7172C203AA; Wed, 12 Feb 2020 12:47:55 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb 12 12:47:55 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1D4782033E
	for <lists-other-nbd@bendel.debian.org>; Wed, 12 Feb 2020 12:47:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.101 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id E549IUNAsHMa for <lists-other-nbd@bendel.debian.org>;
	Wed, 12 Feb 2020 12:47:44 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.7
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by bendel.debian.org (Postfix) with ESMTP id CE79F20330
	for <nbd@other.debian.org>; Wed, 12 Feb 2020 12:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581511658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m/VwUAgLn+spZs6ILlBGj1ShzI55w6iF8Y0rmIwao3c=;
	b=fNvqM07+3DWvgx/ttmOpyZBdlskrsMxEV3r30np8fOGIxMzTA3/vQstEW3qfoTSFZ9PtPX
	KAUW1niJ4cZHQrn6E8eCyh6Q8acKnYwlKjq+QS2cA5n3S0oMKjCPzvjdKq77ImHtvlSip7
	GSfLk/VlXCqR4QoncV9za+JyYdMSC8E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-cy-EjXs4OL6K0Ll4ho03-Q-1; Wed, 12 Feb 2020 07:47:29 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A9AEA0CBF;
	Wed, 12 Feb 2020 12:47:28 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19CD25C1BB;
	Wed, 12 Feb 2020 12:47:24 +0000 (UTC)
Subject: Re: Cross-project NBD extension proposal: NBD_INFO_INIT_STATE
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Wouter Verhelst <w@uter.be>, "nbd@other.debian.org"
 <nbd@other.debian.org>, QEMU <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "libguestfs@redhat.com" <libguestfs@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>
References: <a4394fde-f459-dcb5-1698-013e1e24c388@redhat.com>
 <20200210221234.GH3888@redhat.com>
 <cc6e1e2e-d3a9-c498-354b-d382b5623ca0@redhat.com>
 <20200210225255.GJ3888@redhat.com> <20200212072729.GA22254@grep.be>
 <278d29cd-bc0d-19f0-c2a4-0191d16a677f@redhat.com>
 <20200212123637.GX3888@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <bdb320e8-edb1-9117-2044-500b395d2c11@redhat.com>
Date: Wed, 12 Feb 2020 06:47:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200212123637.GX3888@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: cy-EjXs4OL6K0Ll4ho03-Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <whPEx_vkSM.A.Q1H.7P_QeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/820
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/bdb320e8-edb1-9117-2044-500b395d2c11@redhat.com
Resent-Date: Wed, 12 Feb 2020 12:47:55 +0000 (UTC)

On 2/12/20 6:36 AM, Richard W.M. Jones wrote:

>> Okay, in v2, I will start with just two bits, NBD_INIT_SPARSE
>> (entire image is sparse, nothing is allocated) and NBD_INIT_ZERO
>> (entire image reads as zero), and save any future bits for later
>> additions.  Do we think that 16 bits is sufficient for the amount of
>> initial information likely to be exposed?
> 
> So as I understand the proposal, the 16 bit limit comes about because
> we want a round 4 byte reply, 16 bits are used by NBD_INFO_INIT_STATE
> and that leaves 16 bits feature bits.  Therefore the only way to go
> from there is to have 32 feature bits but an awkward unaligned 6 byte
> structure, or 48 feature bits (8 byte structure).

In general, the NBD protocol has NOT focused on alignment issues (for 
good or for bad).  For example, NBD_INFO_BLOCK_SIZE is 18 bytes; all 
NBD_CMD_* 32-bit requests are 28 bytes except for NBD_CMD_WRITE which 
can send unaligned payload with no further padding, and so forth.

> 
> I guess given those constraints we can stick with 16 feature bits, and
> if we ever needed more then we'd have to introduce NBD_INFO_INIT_STATE2.
> 
> The only thing I can think of which might be useful is a "fully
> preallocated" bit which might be used as an indication that writes are
> fast and are unlikely to fail with ENOSPC.

and which would be mutually-exclusive with NBD_INFO_SPARSE (except for 
an image of size 0).  That bit would ALSO be an indication that the user 
may not want to punch holes into the image, but preserve the 
fully-allocated state (and thus avoid NBD_CMD_TRIM as well as passing 
NBD_CMD_FLAG_NO_HOLE to any WRITE_ZEROES request).

> 
>> Are we in agreement that
>> my addition of an NBD_INFO_ response to NBD_OPT_GO is the best way
>> to expose initial state bits?
> 
> Seems reasonable to me.
> 
> Rich.
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

