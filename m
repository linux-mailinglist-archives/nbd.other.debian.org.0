Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F17B957B52
	for <lists+nbd@lfdr.de>; Tue, 20 Aug 2024 04:09:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2FC0D20608; Tue, 20 Aug 2024 02:09:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug 20 02:09:11 2024
Old-Return-Path: <yizhan@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1AC7D20757
	for <lists-other-nbd@bendel.debian.org>; Tue, 20 Aug 2024 01:51:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.233 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.125, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id m2E6Aql0Hj1i for <lists-other-nbd@bendel.debian.org>;
	Tue, 20 Aug 2024 01:51:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-124.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 77519205E0
	for <nbd@other.debian.org>; Tue, 20 Aug 2024 01:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724118661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zemSLB7cpZj/xdAoHKekxRhjOKghwOYrL/smZ5zzA84=;
	b=O+0I7ry3yqRPxi/pEFeAkSx8nZfSkiGMr/L60xDuJDwQNVhOJybcj7JA+33S+UkXf2/9fF
	E1Azo8P6XIB+RWC4XSz7ZATaIqwulh2ikWfMkpHOmPUGrTaCTVi44dcioyrtw4pFLK2A3+
	nJx13Jh936UGE1STB/Xhcp0KPn3szTE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-o7LvVY4SNHO8GyP4YuYABA-1; Mon, 19 Aug 2024 21:51:00 -0400
X-MC-Unique: o7LvVY4SNHO8GyP4YuYABA-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2d406dc42f4so2487790a91.3
        for <nbd@other.debian.org>; Mon, 19 Aug 2024 18:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724118659; x=1724723459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zemSLB7cpZj/xdAoHKekxRhjOKghwOYrL/smZ5zzA84=;
        b=DW2422FLvh64t9s6Mo5oP6zzV+VpJWMpFOBY52VF58gKBhHjPOjlCQjwQVS72y0t7W
         jA1pBTUzTJ6zTagsSKEYCEYPitaM/vieTpt//9C39rIyS4pPqCOLQtONd2isIP4NGP7I
         9kHhVKNDVYW6MvtYWgcu/c5Kj9oGJZd7iWasUwFHcg5P263UOzNYAX+YxsP264fiw2id
         ++Mt7zBengIzkITFITyRrLxLD+O5n24vbISieics5+wsEQYJU3ft9tc/TIfat83pJFhg
         iRysMBYQGyYV6F7nVhGLP5JHMf6CL3Aqc3XIyc6f+oCHh9v3lZbawtsrKte1WX4hfjaK
         DhzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXB5JpYyOjBcghUiQnz6aKN3NKKy5PUC1yavFVhSolCzZn7+olSyy/PNi0q+uLHIsSPUU=@other.debian.org
X-Gm-Message-State: AOJu0YyBFgRqmn3R0bB8dF3X6g901LZkpBUoKwAWf8Mak8nprDn6Y/ev
	U6EVvcbzmhbIOHgpN91F6LHMTM0BwwmrGP4VtX3lgvalRTzTkeEDAhKbTA/X0rwilElMlDu35IY
	5NWBlChb67GWykdybj5qj4p07uemxwo1SunxBwHNO/Uqn88ztBqvIfwu3soZzQerMBrEVFxkohE
	QjwOnISs0XtK6g+OARdFdV1pDKug==
X-Received: by 2002:a17:90a:8a02:b0:2c8:87e:c2d9 with SMTP id 98e67ed59e1d1-2d3e03e89dcmr12525654a91.39.1724118659445;
        Mon, 19 Aug 2024 18:50:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2xNwaA7efDn4iFU7NRQCn5zeIDhK2iOTMbDt+qvGPJ3lKC0GseK99B8PoX4eAcf/7EG7ilcLRq4e0JUPo6TI=
X-Received: by 2002:a17:90a:8a02:b0:2c8:87e:c2d9 with SMTP id
 98e67ed59e1d1-2d3e03e89dcmr12525636a91.39.1724118659021; Mon, 19 Aug 2024
 18:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <5yal5unzvisrvfhhvsqrsqgu4tfbjp2fsrnbuyxioaxjgbojsi@o2arvhebzes3>
 <ab363932-ab3d-49b1-853d-7313f02cce9e@linux.ibm.com> <ljqlgkvhkojsmehqddmeo4dng6l3yaav6le2uslsumfxivluwu@m7lkx3j4mkkw>
 <79a7ec0d-c22d-44cf-a832-13da05a1fcbd@linux.ibm.com> <CAHj4cs-5DPDFuBzm3aymeAi6UWHhgXSYsgaCACKbjXp=i0SyTA@mail.gmail.com>
 <1f917bc1-8a6a-4c88-a619-cf8ddc4534a4@linux.ibm.com> <tczctp5tkr34o3k3f4dlyhuutgp2ycex6gdbjuqx4trn6ewm2i@qbkza3yr5wdd>
 <f2f9d5b4-3c50-41a9-bc53-49706f6f4e12@linux.ibm.com>
In-Reply-To: <f2f9d5b4-3c50-41a9-bc53-49706f6f4e12@linux.ibm.com>
From: Yi Zhang <yi.zhang@redhat.com>
Date: Tue, 20 Aug 2024 09:50:47 +0800
Message-ID: <CAHj4cs8B-Md_WnPo0Z2o6dZ3n30QqL5D-YbW9wWbCMLjxDSrsg@mail.gmail.com>
Subject: Re: blktests failures with v6.11-rc1 kernel
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, 
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "nbd@other.debian.org" <nbd@other.debian.org>, 
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jrc9gTCM5pB.A.2pD.Hr_wmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3143
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAHj4cs8B-Md_WnPo0Z2o6dZ3n30QqL5D-YbW9wWbCMLjxDSrsg@mail.gmail.com
Resent-Date: Tue, 20 Aug 2024 02:09:11 +0000 (UTC)

On Mon, Aug 19, 2024 at 9:35=E2=80=AFPM Nilay Shroff <nilay@linux.ibm.com> =
wrote:
>
>
>
> On 8/19/24 18:04, Shinichiro Kawasaki wrote:
> > On Aug 14, 2024 / 18:05, Nilay Shroff wrote:
> >>
> >>
> >> On 8/13/24 12:36, Yi Zhang wrote:
> >>> On Sat, Aug 3, 2024 at 12:49=E2=80=AFAM Nilay Shroff <nilay@linux.ibm=
.com> wrote:
> >>>
> >>> There are no simultaneous tests during the CKI tests running.
> >>> I reproduced the failure on that server and always can be reproduced
> >>> within 5 times:
> >>> # sh a.sh
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D0
> >>> nvme/052 (tr=3Dloop) (Test file-ns creation/deletion under one subsys=
tem) [passed]
> >>>     runtime  21.496s  ...  21.398s
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D1
> >>> nvme/052 (tr=3Dloop) (Test file-ns creation/deletion under one subsys=
tem) [failed]
> >>>     runtime  21.398s  ...  21.974s
> >>>     --- tests/nvme/052.out 2024-08-10 00:30:06.989814226 -0400
> >>>     +++ /root/blktests/results/nodev_tr_loop/nvme/052.out.bad
> >>> 2024-08-13 02:53:51.635047928 -0400
> >>>     @@ -1,2 +1,5 @@
> >>>      Running nvme/052
> >>>     +cat: /sys/block/nvme1n2/uuid: No such file or directory
> >>>     +cat: /sys/block/nvme1n2/uuid: No such file or directory
> >>>     +cat: /sys/block/nvme1n2/uuid: No such file or directory
> >>>      Test complete
> >>> # uname -r
> >>> 6.11.0-rc3
> >>
> >> We may need to debug this further. Is it possible to patch blktest and
> >> collect some details when this issue manifests? If yes then can you pl=
ease
> >> apply the below diff and re-run your test? This patch would capture ou=
tput
> >> of "nvme list" and "sysfs attribute tree created under namespace head =
node"
> >> and store those details in 052.full file.
> >>
> >> diff --git a/common/nvme b/common/nvme
> >> index 9e78f3e..780b5e3 100644
> >> --- a/common/nvme
> >> +++ b/common/nvme
> >> @@ -589,8 +589,23 @@ _find_nvme_ns() {
> >>                 if ! [[ "${ns}" =3D~ nvme[0-9]+n[0-9]+ ]]; then
> >>                         continue
> >>                 fi
> >> +               echo -e "\nBefore ${ns}/uuid check:\n" >> ${FULL}
> >> +               echo -e "\n`nvme list -v`\n" >> ${FULL}
> >> +               echo -e "\n`tree ${ns}`\n" >> ${FULL}
> >> +
> >>                 [ -e "${ns}/uuid" ] || continue
> >>                 uuid=3D$(cat "${ns}/uuid")
> >> +
> >> +               if [ "$?" =3D "1" ]; then
> >> +                       echo -e "\nFailed to read $ns/uuid\n" >> ${FUL=
L}
> >> +                       echo "`nvme list -v`" >> ${FULL}
> >> +                       if [ -d "${ns}" ]; then
> >> +                               echo -e "\n`tree ${ns}`\n" >> ${FULL}
> >> +                       else
> >> +                               echo -e "\n${ns} doesn't exist!\n" >> =
${FULL}
> >> +                       fi
> >> +               fi
> >> +
> >>                 if [[ "${subsys_uuid}" =3D=3D "${uuid}" ]]; then
> >>                         basename "${ns}"
> >>                 fi
> >>
> >>
> >> After applying the above diff, when this issue occurs on your system c=
opy this
> >> file "</path/to/blktests>/results/nodev_tr_loop/nvme/052.full" and sen=
d it across.
> >> This may give us some clue about what might be going wrong.
> >
> > Nilay, thank you for this suggestion. To follow it, I tried to recreate=
 the
> > failure again, and managed to do it :) When I repeat the test case 20 o=
r 40
> > times one of my test machines, the failure is observed in stable manner=
.
>
> Shinichiro, I am glad that you were able to recreate this issue.
>
> > I applied your debug patch above to blktests, then I repeated the test =
case.
> > Unfortunately, the failure disappeared. When I repeat the test case 100=
 times,
> > the failure was not observed. I guess the echos for debug changed the t=
iming to
> > access the sysfs uuid file, then the failure disappeared.
>
> Yes this could be possible. BTW, Yi tried the same patch and with the pat=
ch applied,
> this issue could be still reproduced on Yi's testbed!!
> > This helped me think about the cause. The test case repeats _create_nvm=
et_ns
> > and _remove_nvmet_ns. Then, it repeats creating and removing the sysfs =
uuid
> > file. I guess when _remove_nvmet_ns echos 0 to ${nvemt_ns_path}/enable =
to
> > remove the namespace, it does not wait for the completion of the remova=
l work.
> > Then, when _find_nvme_ns() checks existence of the sysfs uuid file, it =
refers to
> > the sysfs uuid file that the previous _remove_nvmet_ns left. When it do=
es cat
> > to the sysfs uuid file, it fails because the sysfs uuid file has got re=
moved,
> > before recreating it for the next _create_nvmet_ns.
>
> I agree with your assessment about the plausible cause of this issue. I j=
ust reviewed
> the nvme target kernel code and it's now apparent to me that we need to w=
ait for the
> removal of the namespace before we re-create the next namespace. I think =
this is a miss.
> >
> > Based on this guess, I created a patch below. It modifies the test case=
 to wait
> > for the namespace device disappears after calling _remove_nvmet_ns. (I =
assume
> > that the sysfs uuid file disappears when the device file disappears). W=
ith
> > this patch, the failure was not observed by repeating it 100 times. I a=
lso
> > reverted the kernel commit ff0ffe5b7c3c ("nvme: fix namespace removal l=
ist")
> > from v6.11-rc4, then confirmed that the test case with this change stil=
l can
> > detect the regression.
> >
> I am pretty sure that your patch would solve this issue.
>
> > I will do some more confirmation. If it goes well, will post this chang=
e as
> > a formal patch.
> >
> > diff --git a/tests/nvme/052 b/tests/nvme/052
> > index cf6061a..469cefd 100755
> > --- a/tests/nvme/052
> > +++ b/tests/nvme/052
> > @@ -39,15 +39,32 @@ nvmf_wait_for_ns() {
> >               ns=3D$(_find_nvme_ns "${uuid}")
> >       done
> >
> > +     echo "$ns"
> >       return 0
> >  }
> >
> > +nvmf_wait_for_ns_removal() {
> > +     local ns=3D$1 i
> > +
> > +     for ((i =3D 0; i < 10; i++)); do
> > +             if [[ ! -e /dev/$ns ]]; then
> > +                     return
> > +             fi
> > +             sleep .1
> > +             echo "wait removal of $ns" >> "$FULL"
> > +     done
> > +
> > +     if [[ -e /dev/$ns ]]; then
> > +             echo "Failed to remove the namespace $"
> > +     fi
> > +}
> > +
> >  test() {
> >       echo "Running ${TEST_NAME}"
> >
> >       _setup_nvmet
> >
> > -     local iterations=3D20
> > +     local iterations=3D20 ns
> >
> >       _nvmet_target_setup
> >
> > @@ -63,7 +80,7 @@ test() {
> >               _create_nvmet_ns "${def_subsysnqn}" "${i}" "$(_nvme_def_f=
ile_path).$i" "${uuid}"
> >
> >               # wait until async request is processed and ns is created
> > -             nvmf_wait_for_ns "${uuid}"
> > +             ns=3D$(nvmf_wait_for_ns "${uuid}")
> >               if [ $? -eq 1 ]; then
> >                       echo "FAIL"
> >                       rm "$(_nvme_def_file_path).$i"
> > @@ -71,6 +88,7 @@ test() {
> >               fi
> >
> >               _remove_nvmet_ns "${def_subsysnqn}" "${i}"
> > +             nvmf_wait_for_ns_removal "$ns"
> >               rm "$(_nvme_def_file_path).$i"
> >       }
> >       done
>
> I think there's some formatting issue in the above patch. I see some stra=
y characters
> which you may cleanup/fix later when you send the formal patch.
>
> Yi, I think you you may also try the above patch on your testbed and conf=
irm the result.

Nilay/Shinichiro

Confirmed the failure cannot be reproduced with this patch now.

>
> Thanks,
> --Nilay
>


--=20
Best Regards,
  Yi Zhang

