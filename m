Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id EC603154504
	for <lists+nbd@lfdr.de>; Thu,  6 Feb 2020 14:34:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9F3C72046B; Thu,  6 Feb 2020 13:34:48 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb  6 13:34:48 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E26A02046C
	for <lists-other-nbd@bendel.debian.org>; Thu,  6 Feb 2020 13:34:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id j9OQk7TtbjUp for <lists-other-nbd@bendel.debian.org>;
	Thu,  6 Feb 2020 13:34:36 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by bendel.debian.org (Postfix) with ESMTP id 4A9B52046B
	for <nbd@other.debian.org>; Thu,  6 Feb 2020 13:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580996069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BHc45otvB4NxOfp8O86UA3sSLkX/QPfQft8KNCbQTOw=;
	b=LLpvX+MqhH7v6Gh2/IB8HdxOkRQ29zHqt+Aki20QScPQZmpjcXi0/XJzBSqt5L73k9EC0F
	wjuQDnByP5RNeeJT0MIhPcJ4eIR8dh7kDZNt9CaVb7UiQnYVOBlg+9Ww2RIUSliYISGs3g
	0RFDpgjrcc9rPw/vqZhEnW3nlNhQ2i4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-bfh7AcMgPPOY52gssQbSMw-1; Thu, 06 Feb 2020 08:34:25 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 939F58F2B64;
	Thu,  6 Feb 2020 13:34:24 +0000 (UTC)
Received: from [10.3.116.166] (ovpn-116-166.phx2.redhat.com [10.3.116.166])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CC7A60BEC;
	Thu,  6 Feb 2020 13:34:23 +0000 (UTC)
Subject: Re: [PATCH 2/2] nbd/proto: add NBD_CMD_WRITE_ZEROES64
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 nbd@other.debian.org
Cc: qemu-block@nongnu.org, w@uter.be, nsoffer@redhat.com, den@openvz.org
References: <20200205164352.16673-1-vsementsov@virtuozzo.com>
 <20200205164352.16673-3-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <bd8d0d11-197e-12b5-2d8a-5a6001adb72c@redhat.com>
Date: Thu, 6 Feb 2020 07:12:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205164352.16673-3-vsementsov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: bfh7AcMgPPOY52gssQbSMw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6h_67jWTC7F.A.4QB.4XBPeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/797
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/bd8d0d11-197e-12b5-2d8a-5a6001adb72c@redhat.com
Resent-Date: Thu,  6 Feb 2020 13:34:48 +0000 (UTC)

On 2/5/20 10:43 AM, Vladimir Sementsov-Ogievskiy wrote:
> Add new structured request type to represent 64bit version of
> NBD_CMD_WRITE_ZEROES.

Initial reaction: why do we need a new NBD_CMD?  Why can't we reuse the 
existing NBD_CMD_WRITE_ZEROES, and merely document that if structured 
messages were negotiated, then calling NBD_CMD_WRITE_ZEROES with a 
structured request gives a larger range of access?

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   doc/proto.md | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index cb0ac56..378a800 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -1096,6 +1096,8 @@ The field has the following format:
>     is set.
>   - bit 12, `NBD_FLAG_STRUCTURED_REQUEST`; allow clients to use
>     structured requests.
> +- bit 13, `NBD_FLAG_SEND_WRITE_ZEROES64`: documents that the server
> +  understands `NBD_CMD_WRITE_ZEROES64` structured request chunk type.

Why do we need this bit?  Could we instead rely on the existing 
NBD_FLAG_SEND_WRITE_ZEROES combined with successful negotiation of 
structured requests as being sufficient to imply that the server 
therefore supports 64-bit zero requests?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

