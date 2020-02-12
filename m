Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F0115A8D1
	for <lists+nbd@lfdr.de>; Wed, 12 Feb 2020 13:09:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5FB32203C3; Wed, 12 Feb 2020 12:09:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb 12 12:09:43 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DC3F4203A5
	for <lists-other-nbd@bendel.debian.org>; Wed, 12 Feb 2020 12:09:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.201 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id iivTvlEm0aQA for <lists-other-nbd@bendel.debian.org>;
	Wed, 12 Feb 2020 12:09:31 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by bendel.debian.org (Postfix) with ESMTP id 6B7EB203B5
	for <nbd@other.debian.org>; Wed, 12 Feb 2020 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581509365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BpKZpxw6wEx5YUDP3l4RsGaV48RTKScpff6gL0xfagI=;
	b=YOx/ePGKITO1tijFupzmwTuzM6A+n43Cc719O8HsjlY3B5QPWLcxUfdd37/IpZ8T3cgSe8
	G/KC8EuGwmh/lGtJy80fFVnN5ZDZqSSMN3zh1bBK3ei+OZdhlUoCBMvXPzxxgcEcK1mO+n
	PH2Y7KO5WMx0L8hkZsuhDlahZ1QmdQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-tMr6bnB0OPuiGxBkuFi7JQ-1; Wed, 12 Feb 2020 07:09:17 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAED41937FC3;
	Wed, 12 Feb 2020 12:09:15 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86F2D5DA83;
	Wed, 12 Feb 2020 12:09:12 +0000 (UTC)
Subject: Re: Cross-project NBD extension proposal: NBD_INFO_INIT_STATE
To: Wouter Verhelst <w@uter.be>, "Richard W.M. Jones" <rjones@redhat.com>
Cc: "nbd@other.debian.org" <nbd@other.debian.org>,
 QEMU <qemu-devel@nongnu.org>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "libguestfs@redhat.com" <libguestfs@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>
References: <a4394fde-f459-dcb5-1698-013e1e24c388@redhat.com>
 <20200210221234.GH3888@redhat.com>
 <cc6e1e2e-d3a9-c498-354b-d382b5623ca0@redhat.com>
 <20200210225255.GJ3888@redhat.com> <20200212072729.GA22254@grep.be>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <278d29cd-bc0d-19f0-c2a4-0191d16a677f@redhat.com>
Date: Wed, 12 Feb 2020 06:09:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200212072729.GA22254@grep.be>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: tMr6bnB0OPuiGxBkuFi7JQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UH_7TU2ESqB.A.lFF.Hs-QeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/818
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/278d29cd-bc0d-19f0-c2a4-0191d16a677f@redhat.com
Resent-Date: Wed, 12 Feb 2020 12:09:43 +0000 (UTC)

On 2/12/20 1:27 AM, Wouter Verhelst wrote:
> Hi,
> 
> On Mon, Feb 10, 2020 at 10:52:55PM +0000, Richard W.M. Jones wrote:
>> But anyway ... could a flag indicating that the whole image is sparse
>> be useful, either as well as NBD_INIT_SPARSE or instead of it?  You
>> could use it to avoid an initial disk trim, which is something that
>> mke2fs does:
> 
> Yeah, I think that could definitely be useful. I honestly can't see a
> use for NBD_INIT_SPARSE as defined in this proposal; and I don't think
> it's generally useful to have a feature if we can't think of a use case
> for it (that creates added complexity for no benefit).
> 
> If we can find a reasonable use case for NBD_INIT_SPARSE as defined in
> this proposal, then just add a third bit (NBD_INIT_ALL_SPARSE or
> something) that says "the whole image is sparse". Otherwise, I think we
> should redefine NBD_INIT_SPARSE to say that.

Okay, in v2, I will start with just two bits, NBD_INIT_SPARSE (entire 
image is sparse, nothing is allocated) and NBD_INIT_ZERO (entire image 
reads as zero), and save any future bits for later additions.  Do we 
think that 16 bits is sufficient for the amount of initial information 
likely to be exposed?  Are we in agreement that my addition of an 
NBD_INFO_ response to NBD_OPT_GO is the best way to expose initial state 
bits?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

