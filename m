Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 377F4715D29
	for <lists+nbd@lfdr.de>; Tue, 30 May 2023 13:27:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1C51020867; Tue, 30 May 2023 11:27:27 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 30 11:27:27 2023
Old-Return-Path: <lersek@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A6EF42084B
	for <lists-other-nbd@bendel.debian.org>; Tue, 30 May 2023 11:10:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.351 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.161, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tcxhdjWx-LVZ for <lists-other-nbd@bendel.debian.org>;
	Tue, 30 May 2023 11:10:15 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 53EA22083D
	for <nbd@other.debian.org>; Tue, 30 May 2023 11:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685445010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9P6V8+P1ZNNDrChXIq2OudnrhMoFBBDICf5yc/VFDUM=;
	b=BOkdA6TGVfLIIMR+R8tnKDLiK6W8iz1SOnZ8dyaBKnbfQ0YlIIARRigpc8+Vpyg2ExhniG
	59Fpe2Mzt8GKuPdOHM6HzZeXA7hgalhCQUhSd8YTcBQj8jupw+M/GN8EK/hrXuZB8tZrz5
	xJlwsasrtHxX3/B1dhtFoW7Ejefi09s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-3dp9i7EGMuKPC_hRCQhVDw-1; Tue, 30 May 2023 07:10:08 -0400
X-MC-Unique: 3dp9i7EGMuKPC_hRCQhVDw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0506185A78E;
	Tue, 30 May 2023 11:10:07 +0000 (UTC)
Received: from [10.39.195.136] (unknown [10.39.195.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EC48420A8;
	Tue, 30 May 2023 11:10:06 +0000 (UTC)
Message-ID: <ac9bb901-eb21-1c47-9885-3889334802ca@redhat.com>
Date: Tue, 30 May 2023 13:10:05 +0200
MIME-Version: 1.0
Subject: Re: [Libguestfs] [libnbd PATCH v3 02/22] internal: Refactor layout of
 replies in sbuf
To: Eric Blake <eblake@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-3-eblake@redhat.com>
 <1fa92626-e5ac-5e95-f697-88804020ad46@redhat.com>
 <87df235a-0e5f-8c36-bff1-15910bc3947c@redhat.com>
 <5dmg2bdgkse5loxfkqisvt3jwjjzvlrf4zzdqaj5mxsrikznwa@6jhsdkwdqum2>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <5dmg2bdgkse5loxfkqisvt3jwjjzvlrf4zzdqaj5mxsrikznwa@6jhsdkwdqum2>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <KqNtKavNofN.A.odF.f2ddkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2508
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ac9bb901-eb21-1c47-9885-3889334802ca@redhat.com
Resent-Date: Tue, 30 May 2023 11:27:27 +0000 (UTC)

On 5/26/23 23:26, Eric Blake wrote:
> On Fri, May 26, 2023 at 06:09:00PM +0200, Laszlo Ersek wrote:
>> On 5/26/23 17:53, Laszlo Ersek wrote:
>>
>>> Optimally, the simple reply and the structured reply should look like
>>> this:
>>>
>>>   struct nbd_reply_header {
>>>     uint32_t magic;
>>>     union {
>>>       struct {
>>>         uint32_t error;
>>>         uint64_t handle;
>>>       } simple;
>>>       struct {
>>>         uint16_t flags;
>>>         uint16_t type;
>>>         uint64_t handle;
>>>         uint32_t length;
>>>       } structured;
>>>     } magic_specific;
>>>   };
>>>
>>> and we should have separate automaton states for reading
>>> "magic_specific.simple" and "magic_specific.structured".
>>>
>>> In REPLY.START, we should only read "magic".
>>>
>>> We should have a sepate state called REPLY.SIMPLE_REPLY.START, for
>>> reading "magic_specific.simple".
>>>
>>> In REPLY.STRUCTURED_REPLY.START, we should point h->rbuf at
>>> "magic_specific.structured", and read "sizeof magic_specific.structured"
>>> bytes.
>>
>> This (pre-patch) part:
>>
>>   /* NB: This works for both simple and structured replies because the
>>    * handle (our cookie) is stored at the same offset.
>>    */
>>   [...]
>>   cookie = be64toh (h->sbuf.simple_reply.handle);
>>
>> is disconcerting as well. I think it's well-defined C, but a hack
>> nonetheless.
>>
>> IMO, unions are justified for two purposes:
>>
>> - deliberately reinterpreting one object representation as another
>>
>> - saving space, when at most one of N objects is expected to exist at
>> any given time.
>>
>> Both of those uses follow from intentional elements of a design. But the
>> fact that "handle" is at the same offset in both "simple" and
>> "structured" is totally arbitrary. IMO this is a hack.
> 
> It is not completely arbitrary: when structured replies were added to
> the NBD spec, the choice of having handle at the same offset was
> intentional.  Similarly, extended replies have it at the same offset
> as well.  But a STATIC_ASSERT proving that would go a long way to
> proving our intent, more than just a comment in the code.

Right, a STATIC_ASSERT would be great.

Thanks!
Laszlo

