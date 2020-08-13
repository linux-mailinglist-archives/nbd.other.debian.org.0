Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 16371243DC2
	for <lists+nbd@lfdr.de>; Thu, 13 Aug 2020 18:56:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BAAC520446; Thu, 13 Aug 2020 16:56:36 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 13 16:56:36 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8AAD620448
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Aug 2020 16:56:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.635 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.453,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Sy7Dgm-wi7_B for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Aug 2020 16:56:23 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by bendel.debian.org (Postfix) with ESMTP id 205802044B
	for <nbd@other.debian.org>; Thu, 13 Aug 2020 16:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597337777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RILZHThzR/5rRHK3NQbfrzM5/t0O/rYWLqb+HNhzzuE=;
	b=WYubprbgynkwEfhid2/vU/x3wN7t7hb5ySaGjH8UoiyoMcWFWznNDWKKRsKF6gL4WECRRz
	OGUQ55EFNB4QHQ29HmE1mGdOK/QKgJyiYJCMpwQppgmY6rcCuO2182JAm71v7w5kWQsDa+
	2UahNiizOvi1SbcRTvT4magIMC7T0Wo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-FBqQaOc1NDm7oS51I6LEgw-1; Thu, 13 Aug 2020 12:25:21 -0400
X-MC-Unique: FBqQaOc1NDm7oS51I6LEgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F34C6871805;
	Thu, 13 Aug 2020 16:25:19 +0000 (UTC)
Received: from [10.3.113.241] (ovpn-113-241.phx2.redhat.com [10.3.113.241])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1D5919C78;
	Thu, 13 Aug 2020 16:25:19 +0000 (UTC)
Subject: Re: [PATCH firewalld] feat: service: add nbd (Network Block Device)
 service
To: Eric Garver <eric@garver.life>, "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, firewalld-devel@lists.fedorahosted.org
References: <20200813123854.967482-1-rjones@redhat.com>
 <20200813152831.GA5823@roberto>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <12f630d0-edf6-399c-f907-bff288a21527@redhat.com>
Date: Thu, 13 Aug 2020 11:25:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200813152831.GA5823@roberto>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <s013xnn1mtJ.A.hcC.EDXNfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/935
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/12f630d0-edf6-399c-f907-bff288a21527@redhat.com
Resent-Date: Thu, 13 Aug 2020 16:56:36 +0000 (UTC)

On 8/13/20 10:28 AM, Eric Garver wrote:
> On Thu, Aug 13, 2020 at 01:38:54PM +0100, Richard W.M. Jones wrote:
>> ---
>>   config/Makefile.am      | 1 +
>>   config/services/nbd.xml | 6 ++++++
>>   po/POTFILES.in          | 1 +
>>   3 files changed, 8 insertions(+)
> 
> Thanks! I applied and pushed this upstream:
> 
>      8f562559dad8 ("feat: service: add nbd (Network Block Device)
>      service")

Unrelated question - why can't firewalld automatically support an 
implied service for every listing in /etc/services, in order to reduce 
the number of patches needed to config/services/*.xml which end up 
duplicating efforts?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

