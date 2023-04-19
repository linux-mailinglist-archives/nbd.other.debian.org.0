Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 724746E7283
	for <lists+nbd@lfdr.de>; Wed, 19 Apr 2023 07:04:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 50ED620CEC; Wed, 19 Apr 2023 05:04:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Apr 19 05:04:23 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	LONGWORD,MURPHY_DRUGS_REL8,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0F4EF20CD5
	for <lists-other-nbd@bendel.debian.org>; Wed, 19 Apr 2023 05:04:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	LONGWORD=2, MURPHY_DRUGS_REL8=0.02] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LbwSopbBKKgH for <lists-other-nbd@bendel.debian.org>;
	Wed, 19 Apr 2023 05:04:07 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A4B4620CE2
	for <nbd@other.debian.org>; Wed, 19 Apr 2023 05:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2OuK3Sy/PuCKO7v23hE1ePlbx9dEnmL89Vy1Bhyf040=; b=VKIei1wcakYAFNuDCxV99MOJmL
	JxecQkz5FAPi2YlDWZz2hlE7UkJHE5SxLftx72D91eBnkXvEbODRXHIUXmOF4/D0nEARe298Ko066
	5HYNy5Et5VJAJuqOrw2TSzT+wHTTSE1U3K7K/2XPcPzO1IHC0l+TLLJ7SuyPFfBgbA0UeLpYzYPBO
	F98cLQ7O0Y9ByCRD/leLHjKu4kHmxzpKAFJLZiiYtJ3IjbgaUdoRZ/4ZtKeXJtYSaIEJD7r2Tf8Zx
	gFIscjlmgrvvxKC3KCi8gQ9mU7mHGGNsiVbdDM9bpM6ScF9Pda3g7wQrhG8Dx/eMDSVUulasDEsw5
	A1kTZb3A==;
Received: from dd5fb47a2.static.telenet.be ([213.251.71.162] helo=[127.0.0.1])
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1pozz9-003q1C-Oy; Wed, 19 Apr 2023 07:04:03 +0200
Date: Wed, 19 Apr 2023 07:03:56 +0200
From: Wouter Verhelst <w@uter.be>
To: nbd@other.debian.org, "Richard W.M. Jones" <rjones@redhat.com>
CC: Eric Blake <eblake@redhat.com>, libguestfs@redhat.com, qemu-block@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BLibguestfs=5D_=5BPATCH_v3_6/6=5D_RFC=3A_spec?= =?US-ASCII?Q?=3A_Introduce_NBD=5FREPLY=5FTYPE=5FOFFSET=5FHOLE=5FEXT?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20230418141311.GS7773@redhat.com>
References: <20230413220241.1396012-1-eblake@redhat.com> <20230413220241.1396012-7-eblake@redhat.com> <ZD6OJXoQBNJH5p4W@pc220518.home.grep.be> <20230418141311.GS7773@redhat.com>
Message-ID: <626173F3-DE35-4B40-BE48-2633E8EF1E6F@uter.be>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Gp2jq4dHzmH.A.sPG.XZ3PkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2438
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/626173F3-DE35-4B40-BE48-2633E8EF1E6F@uter.be
Resent-Date: Wed, 19 Apr 2023 05:04:23 +0000 (UTC)

Apologies; I somehow misread Eric's mail into thinking that the implementat=
ion wasn't ready yet=2E Not sure what happened there=2E

If there is an implementation (and clearly there is a need) then I have no=
 objection to merging this on master=2E

Reviewed-By: Wouter Verhelst <w@uter=2Ebe>

"Richard W=2EM=2E Jones" <rjones@redhat=2Ecom> schreef op 18 april 2023 16=
:13:11 CEST:
>On Tue, Apr 18, 2023 at 02:33:41PM +0200, Wouter Verhelst wrote:
>> On Thu, Apr 13, 2023 at 05:02:41PM -0500, Eric Blake wrote:
>> > Rather than requiring all servers and clients to have a 32-bit limit
>> > on maximum NBD_CMD_READ/WRITE sizes, we can choose to standardize
>> > support for a 64-bit single I/O transaction now=2E
>> > NBD_REPLY_TYPE_OFFSET_DATA can already handle a large reply, but
>> > NBD_REPLY_TYPE_OFFSET_HOLE needs a 64-bit counterpart=2E
>> >=20
>> > By standardizing this, all clients must be prepared to support both
>> > types of hole type replies, even though most server implementations o=
f
>> > extended replies are likely to only send one hole type=2E
>>=20
>> I think it's probably a better idea to push this patch to a separate
>> "extension-*" branch, and link to that from proto=2Emd on master=2E Tho=
se
>> are documented as "we standardized this, but no first implementor exist=
s
>> yet"=2E
>>=20
>> If someone actually comes up with a reason for 64-bit transactions, we
>> can then see if the spec matches the need and merge it to master=2E
>>=20
>> Otherwise this feels too much like a solution in search of a problem to
>> me=2E
>
>I'd like to push back a bit on this=2E  Firstly Eric does have two
>complete implementations=2E  It's true however that they not upstream in
>either case=2E
>
>But we also need this because there are relatively serious issues
>observed, particularly around trimming/zeroing, and extents=2E  The
>trimming problem can be demonstrated very easily in fact:
>
>    $ nbdkit -U - --filter=3Dstats memory 1P statsfile=3D/dev/stdout --ru=
n ' time guestfish add "" protocol:nbd server:unix:$unixsocket discard:enab=
le format:raw : run : mkfs xfs /dev/sda '
>   =20
>    real	 4m17=2E531s
>    user	 0m0=2E032s
>    sys	 0m0=2E040s
>    total: 1066328 ops, 257=2E558068 s, 1048578=2E04 GiB, 4071=2E23 GiB/s
>    read: 4356 ops, 0=2E003335 s, 14=2E61 MiB, 4=2E28 GiB/s op, 58=2E08 K=
iB/s total
>      Request size and alignment breakdown:
>        12 bits: 50=2E8% (2215 reqs, 8=2E65 MiB total)
>             12 bit aligned: 100=2E0% (2215)
>             13 bit aligned:  51=2E6% (1143)
>             14 bit aligned:  26=2E9% (595)
>             15 bit aligned:  14=2E6% (323)
>             16 bit aligned:   8=2E4% (185)
>             17+ bit-aligned:  4=2E9% (109)
>         9 bits: 47=2E4% (2064 reqs, 1=2E01 MiB total)
>              9 bit aligned: 100=2E0% (2064)
>             10+ bit-aligned:  0=2E6% (13)
>        other sizes:  1=2E8% (77 reqs, 14=2E61 MiB total)
>   =20
>    write: 13325 ops, 0=2E046782 s, 31=2E29 MiB, 668=2E91 MiB/s op, 124=
=2E41 KiB/s total
>      Request size and alignment breakdown:
>        12 bits: 53=2E8% (7170 reqs, 28=2E01 MiB total)
>             12 bit aligned: 100=2E0% (7170)
>             13 bit aligned:  50=2E0% (3585)
>             14 bit aligned:  25=2E0% (1793)
>             15 bit aligned:  12=2E5% (896)
>             16 bit aligned:   6=2E2% (448)
>             17+ bit-aligned:  3=2E1% (224)
>         9 bits: 46=2E2% (6150 reqs, 3=2E00 MiB total)
>              9 bit aligned: 100=2E0% (6150)
>             10 bit aligned:  33=2E4% (2054)
>             12 bit aligned:  16=2E7% (1029)
>             13 bit aligned:   8=2E4% (515)
>             14+ bit-aligned:  4=2E2% (259)
>        other sizes:  0=2E0% (5 reqs, 31=2E29 MiB total)
>   =20
>    trim: 1048576 ops, 306=2E059735 s, 1048576=2E00 GiB, 3426=2E05 GiB/s =
op, 4071=2E22 GiB/s total
>      Request size and alignment breakdown:
>        30 bits: 100=2E0% (1048576 reqs, 1048576=2E00 GiB total)
>             30 bit aligned: 100=2E0% (1048576)
>             31 bit aligned:  50=2E0% (524288)
>             32 bit aligned:  25=2E0% (262144)
>             33 bit aligned:  12=2E5% (131072)
>             34 bit aligned:   6=2E2% (65536)
>             35+ bit-aligned:  3=2E1% (32768)
>   =20
>    zero: 64 ops, 0=2E003912 s, 1=2E99 GiB, 508=2E75 GiB/s op, 7=2E91 MiB=
/s total
>      Request size and alignment breakdown:
>        25 bits: 98=2E4% (63 reqs, 1=2E97 GiB total)
>             13 bit aligned: 100=2E0% (63)
>        other sizes:  1=2E6% (1 reqs, 1=2E99 GiB total)
>   =20
>    flush: 7 ops, 0=2E000001 s, 0 bytes, 0 bytes/s op, 0 bytes/s total
>
>Note how trim takes a million operations and most of the time=2E  That
>should be done in one operation=2E  If you stop advertising discard
>support on the disk ("discard:disable") it takes only a fraction of
>the time=2E
>
>The extents one is harder to demonstrate, but it makes our code
>considerably more complex that we cannot just grab the extent map for
>a whole disk larger than 4GB in a single command=2E  (The complexity
>won't go away, but the querying will be faster with fewer round trips
>with this change=2E)
>
>Nevertheless I'm not opposed to keeping this as an extension until the
>implementations are upstream and bedded in=2E
>
>Rich=2E
>
>
>> With that said, for the things I didn't reply to, you can add:
>>=20
>> Reviewed-By: Wouter Verhelst <w@uter=2Ebe>
>>=20
>> --=20
>>      w@uter=2E{be,co=2Eza}
>> wouter@{grep=2Ebe,fosdem=2Eorg,debian=2Eorg}
>>=20
>> I will have a Tin-Actinium-Potassium mixture, thanks=2E
>>=20
>> _______________________________________________
>> Libguestfs mailing list
>> Libguestfs@redhat=2Ecom
>> https://listman=2Eredhat=2Ecom/mailman/listinfo/libguestfs
>

--=20
Verstuurd vanaf mijn Android apparaat met K-9 Mail=2E Excuseer mijn beknop=
theid=2E

